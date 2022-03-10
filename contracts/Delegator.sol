//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;
import "hardhat/console.sol";

contract Delegator {
    address public delegatorAddress;
    uint public delegatorAmount;

    constructor(address _address, uint _delegatorAmount) {
        delegatorAddress = _address;
        delegatorAmount = _delegatorAmount;
    }

    function print() public view {
        console.log("    --Delegator--");
        console.log("    delegatorAddress:", delegatorAddress);
        console.log("    delegatorAmount:", delegatorAmount);
    }
}