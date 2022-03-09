//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;
import "hardhat/console.sol";

contract Promoter {
    string public promoterName;
    address public promoterAddress;
    uint public stakeAmount;

    constructor(string memory _name, address _address, uint _amount) {
        promoterName = _name;
        promoterAddress = _address;
        stakeAmount = _amount;
    }

    function print() public view {
        console.log("promoterName:", promoterName);
        console.log("promoterAddress:", promoterAddress);
        console.log("stakeAmount:", stakeAmount);
    }
}