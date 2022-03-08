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

    function print() public {
        console.log("promoterName:", promoterName);
        console.log("promoterAddress:", promoterAddress);
        console.log("stakeAmount:", stakeAmount);
    }
}

contract Event {
    string public eventName;    
}

contract TicketMundo {
  uint public x;
  Promoter p1;

  constructor(uint _x) {
    console.log("hi from constructor");
    p1 = new Promoter("promoter1", msg.sender, 999);
    p1.print();

    x = _x;
  }

  function modifyToLeet() public {
    x = 1337;
  }

}