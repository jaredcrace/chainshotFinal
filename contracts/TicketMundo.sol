//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;
import "hardhat/console.sol";
import "contracts/Promoter.sol";
import "contracts/Event.sol";

contract TicketMundo {
  uint public x;
  Promoter p1;
  Event e1;

  constructor(uint _x, uint[] memory _ticketArray) {
    p1 = new Promoter("promoter1", msg.sender, 999);
    p1.print();

    e1 = new Event("event1", "date1", msg.sender, 10, _ticketArray);
    e1.print();

    x = _x;
  }

  function modifyToLeet() public {
    x = 1337;
  }

}