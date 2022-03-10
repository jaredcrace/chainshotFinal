//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;
import "hardhat/console.sol";

contract Seller {
    address public sellerAddress;
    uint public stakeAmount;
    uint public ticketsToSell;
    uint public sellerId;

    constructor(address _address, uint _stakeAmount, uint _ticketsToSell, uint _sellerId) {
        sellerAddress = _address;
        stakeAmount = _stakeAmount;
        ticketsToSell = _ticketsToSell;
        sellerId = _sellerId;
    }

    function print() public view {
        console.log("  --Seller--");
        console.log("  sellerId:", sellerId);
        console.log("  sellerAddress:", sellerAddress);
        console.log("  stakeAmount:", stakeAmount);
        console.log("  ticketsToSell:", ticketsToSell);
    }
}