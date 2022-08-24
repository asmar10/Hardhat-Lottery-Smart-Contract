//enter the lottery by paying some amount
//pick a random winner for the lottery
//automatically select a random winner
//oracles -> randomness, chainlink keeper

//SPDX-MIT-License-Identifier

error Raffle_insufficientETHAmount();

contract Raffle {
    uint256 private immutable i_lotteryFee;
    address payable[] private s_contestants;

    event lotteryEnter(address indexed player);

    constructor(uint256 _lotteryFee) {
        i_lotteryFee = _lotteryFee;
    }

    function enterLottery() public payable {
        if (msg.value < i_lotteryFee) {
            revert Raffle_insufficientETHAmount();
        } else {
            s_contestants.push(msg.sender);
            emit lotteryEnter(msg.sender);
        }
    }

    function i_lotteryFee() public view returns (uint256) {
        return i_lotteryFee();
    }

    function contestant(uint256 index) public view returns (address) {
        return (contestants[index]);
    }
}
