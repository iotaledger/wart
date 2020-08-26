package main

import (
	"github.com/iotaledger/wart/wasp"
	"strconv"
	"strings"
)

const (
	RequestNop        int64 = 1
	RequestInc        int64 = 2
	RequestIncRepeat1 int64 = 3
	RequestIncMany    int64 = 4
	RequestPlaceBet   int64 = 5
	RequestLockBets   int64 = 6
	RequestPayWinners int64 = 7
	RequestPlayPeriod int64 = 0x4008
)

const NUM_COLORS int64 = 5
const PLAY_PERIOD int64 = 120

type BetInfo struct {
	reqHash string
	sender  string
	color   int64
	amount  int64
}

func main() {
}

//export test
func test() {
	keyId := wasp.GetKey("timestamp")
	wasp.SetInt(1, keyId, 123456789)
	timestamp := wasp.GetInt(1, keyId)
	wasp.SetInt(1, keyId, timestamp)

	keyId2 := wasp.GetKey("error2")
	wasp.SetString(1, keyId2, "Test")
	error2 := wasp.GetString(1, keyId2)
	wasp.SetString(1, keyId2, error2)
}

//export no_op
func no_op() {
	ctx := wasp.NewScContext()
	ctx.Log("Doing nothing as requested. Oh, wait...")
}

//export increment
func increment() {
	ctx := wasp.NewScContext()
	ctx.Log("Increment...")
	counter := ctx.State().GetInt("counter")
	counter.SetValue(counter.Value() + 1)
}

//export incrementRepeat1
func incrementRepeat1() {
	ctx := wasp.NewScContext()
	ctx.Log("incrementRepeat1...")
	counter := ctx.State().GetInt("counter")
	value := counter.Value()
	counter.SetValue(value + 1)
	if value == 0 {
		request := ctx.Requests().GetMap(0)
		request.GetInt("reqCode").SetValue(RequestInc)
		request.GetInt("reqDelay").SetValue(5)
	}
}

//export incrementRepeatMany
func incrementRepeatMany() {
	ctx := wasp.NewScContext()
	ctx.Log("incrementRepeatMany...")
	counter := ctx.State().GetInt("counter")
	value := counter.Value()
	counter.SetValue(value + 1)
	repeats := ctx.Params().GetInt("numRepeats").Value()
	stateRepeats := ctx.State().GetInt("numRepeats")
	if repeats == 0 {
		repeats = stateRepeats.Value()
		if repeats == 0 {
			return
		}
	}
	stateRepeats.SetValue(repeats - 1)
	request := ctx.Requests().GetMap(0)
	request.GetInt("reqCode").SetValue(RequestIncMany)
	request.GetInt("reqDelay").SetValue(3)
}

//export placeBet
func placeBet() {
	ctx := wasp.NewScContext()
	ctx.Log("Place bet...")
	amount := ctx.RequestBalance("iota")
	if amount == 0 {
		ctx.Log("Empty bet...")
		return
	}
	color := ctx.Params().GetInt("color").Value()
	if color == 0 {
		ctx.Log("No color...")
		return
	}
	if color < 1 || color > NUM_COLORS {
		ctx.Log("Invalid color...")
		return
	}

	bet := &BetInfo{
		reqHash: ctx.RequestHash(),
		sender:  ctx.Sender(),
		color:   color,
		amount:  amount,
	}

	state := ctx.State()
	bets := state.GetStringArray("bets")
	betNr := bets.Length()
	betData := bet_to_string(bet)
	bets.GetString(betNr).SetValue(betData)
	if betNr == 0 {
		playPeriod := state.GetInt("playPeriod").Value()
		if playPeriod < 10 {
			playPeriod = PLAY_PERIOD
		}
		request := ctx.Requests().GetMap(0)
		request.GetInt("reqCode").SetValue(RequestLockBets)
		request.GetInt("reqDelay").SetValue(playPeriod)
	}
}

//export lockBets
func lockBets() {
	ctx := wasp.NewScContext()
	ctx.Log("Lock bets...")

	// can only be sent by SC itself
	if ctx.Sender() != ctx.ScAddress() {
		ctx.Log("Cancel spoofed request")
		return
	}

	state := ctx.State()
	bets := state.GetStringArray("bets")
	lockedBets := state.GetStringArray("lockedBets")
	for i := int32(0); i < bets.Length(); i++ {
		bet := bets.GetString(i).Value()
		lockedBets.GetString(i).SetValue(bet)
	}
	bets.Clear()

	request := ctx.Requests().GetMap(0)
	request.GetInt("reqCode").SetValue(RequestPayWinners)
}

//export payWinners
func payWinners() {
	ctx := wasp.NewScContext()
	ctx.Log("Pay winners...")

	// can only be sent by SC itself
	scAddress := ctx.ScAddress()
	if ctx.Sender() != scAddress {
		ctx.Log("Cancel spoofed request")
		return
	}

	winningcolor := ctx.Random(5) + 1
	state := ctx.State()
	state.GetInt("lastWinningColor").SetValue(winningcolor)

	totalBetAmount := int64(0)
	totalWinAmount := int64(0)
	lockedBets := state.GetStringArray("lockedBets")
	winners := make([]*BetInfo, 0)
	for i := int32(0); i < lockedBets.Length(); i++ {
		betData := lockedBets.GetString(i).Value()
		bet := stringToBet(betData)
		totalBetAmount += bet.amount
		if bet.color == winningcolor {
			totalWinAmount += bet.amount
			winners = append(winners, bet)
		}
	}
	lockedBets.Clear()

	if len(winners) == 0 {
		ctx.Log("Nobody wins!")
		// compact separate UTXOs into a single one
		transfer := ctx.Transfers().GetMap(0)
		transfer.GetString("xferAddress").SetValue(scAddress)
		transfer.GetInt("xferAmount").SetValue(totalBetAmount)
		return
	}

	totalPayout := int64(0)
	for i := 0; i < len(winners); i++ {
		bet := winners[i]
		payout := totalBetAmount * bet.amount / totalWinAmount
		if payout != 0 {
			totalPayout += payout
			transfer := ctx.Transfers().GetMap(int32(i))
			transfer.GetString("xferAddress").SetValue(bet.sender)
			transfer.GetInt("xferAmount").SetValue(payout)
		}
		text := "Pay " + strconv.FormatInt(payout, 10) + " to " + bet.sender
		ctx.Log(text)
	}

	if totalPayout != totalBetAmount {
		remainder := totalBetAmount - totalPayout
		text := "Remainder is " + strconv.FormatInt(remainder, 10)
		ctx.Log(text)
	}
}

//export playPeriod
func playPeriod() {
	ctx := wasp.NewScContext()
	ctx.Log("Play period...")

	// can only be sent by SC itself
	if ctx.Sender() != ctx.Owner() {
		ctx.Log("Cancel spoofed request")
		return
	}

	playPeriod := ctx.Params().GetInt("playPeriod").Value()
	if playPeriod < 10 {
		ctx.Log("Invalid play period...")
		return
	}

	ctx.State().GetInt("playPeriod").SetValue(playPeriod)
}

type TokenInfo struct {
	supply      int64
	mintedBy    string
	owner       string
	created     int64
	updated     int64
	description string
	userDefined string
}

//export tokenMint
func tokenMint() {
	ctx := wasp.NewScContext()
	ctx.Log("Token mint...")
	//TBD
}

func bet_to_string(bet *BetInfo) string {
	return bet.reqHash + "|" +
		bet.sender + "|" +
		strconv.FormatInt(bet.color, 10) + "|" +
		strconv.FormatInt(bet.amount, 10)
}

func stringToBet(data string) *BetInfo {
	parts := strings.Split(data, "|")
	color, _ := strconv.ParseInt(parts[2], 10, 64)
	amount, _ := strconv.ParseInt(parts[3], 10, 64)
	return &BetInfo{
		reqHash: parts[0],
		sender:  parts[1],
		color:   color,
		amount:  amount,
	}
}
