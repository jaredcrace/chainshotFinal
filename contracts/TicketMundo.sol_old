//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;
import "hardhat/console.sol";
import "contracts/Promoter.sol";
import "contracts/Event.sol";

contract TicketMundo {
  uint public x;

  mapping(uint => Event) public eventList;
  uint[] public eventIds;

  constructor() {
    console.log("hi from constructor");
  }

  function addEvent(
    string memory _eventName, 
    string memory _eventDate, 
    uint _ticketNum, 
    uint _eventId, 
    uint[] memory _ticketArray) public { 
      Event e1 = new Event(_eventName, _eventDate, msg.sender, _ticketNum, _eventId, _ticketArray);
      eventList[_eventId] = e1;
      eventIds.push(_eventId);
  }

  function addPromoterToEvent(string memory _promoterName, uint _promoterStake, uint eventId) public {
    eventList[eventId].addPromoter(_promoterName, _promoterStake, msg.sender);
  }

  function addSellerToEvent(uint _sellerStake, uint _ticketsToSell, uint eventId, uint _sellerId) public {
    eventList[eventId].addTicketSeller(_sellerStake, _ticketsToSell, _sellerId, msg.sender);
  }

//  function sellTicket(uint ticketPrice, uint ticketCount, uint eventId, uint sellerId, address ticketRecvAddress) public {
//    eventList[eventId].sellTicket(ticketPrice, ticketCount, sellerId, ticketRecvAddress);
//  }

  function addDelegatorToSeller(uint eventId, uint sellerId, uint delegatorAmount) public {
    eventList[eventId].addDelegatorToSeller(sellerId, delegatorAmount, msg.sender);
  }

  function printEvents() public view {
    for(uint i=0; i<eventIds.length; i++) {
      eventList[eventIds[i]].print();
    }
  }

}