//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;
import "hardhat/console.sol";
import "contracts/Promoter.sol";
import "contracts/Event.sol";

contract TicketMundo {
  uint public x;
  Event[] eventList;

  constructor() {
//    p1 = new Promoter("promoter1", msg.sender, 999);
//    p1.print();
    console.log("hi from constructor");
  }

  function addEvent(
    string memory _eventName, 
    string memory _eventDate, 
    uint _ticketNum, 
    uint _eventId, 
    uint[] memory _ticketArray) public { 
      Event e1 = new Event(_eventName, _eventDate, msg.sender, _ticketNum, _eventId, _ticketArray);
      eventList.push(e1);
  }

  function addPromoterToEvent(string memory _promoterName, uint _promoterStake, uint eventId) public {
    // first, find the event
    // TODO: add a revert check here
    for(uint i=0; i<eventList.length; i++){
      if(eventList[i].eventId() == eventId) {
        eventList[i].addPromoter(_promoterName, _promoterStake, msg.sender);
      }
    }
  }

  function printEvents() public view {
    for(uint i=0; i<eventList.length; i++) {
      eventList[i].print();
    }
  }

}