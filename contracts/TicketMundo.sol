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
    string public eventDate;
    uint public ticketNum;
    uint256[] public ticketArray;
    uint public eventId;
    address public eventAddress;

    constructor(
      string memory _name, 
      string memory _eventDate, 
      address _address, 
      uint _ticketNum, 
      uint[] memory _ticketArray) 
      {
      eventName = _name;
      eventDate = _eventDate;
      eventAddress = _address;
      ticketNum = _ticketNum;

      // fill the ticket array
      for(uint i=0; i<ticketNum; i++) {
        ticketArray.push(_ticketArray[i]);
      }
    }

    function print() public {
      console.log("eventName:", eventName);
      console.log("eventDate:", eventDate);
      console.log("eventAddress:", eventAddress);
      console.log("ticketNum:", ticketNum);
      console.log("tickets:");
      for(uint i=0; i<ticketNum; i++) {
        console.log(ticketArray[i]);
      }
    }
}

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