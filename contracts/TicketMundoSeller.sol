//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;
import "hardhat/console.sol";

contract TicketMundoSeller {
    address public sellerAddress;
    uint public stakeAmount;
    uint public ticketsToSell;

    constructor(address _address, uint _stakeAmount, uint _ticketsToSell) {
        sellerAddress = _address;
        stakeAmount = _stakeAmount;
        ticketsToSell = _ticketsToSell;
    }

    function print() public view {
        console.log("  --TicketMundoSeller--");
        console.log("  sellerAddress:", sellerAddress);
        console.log("  stakeAmount:", stakeAmount);
        console.log("  ticketsToSell:", ticketsToSell);
    }
}