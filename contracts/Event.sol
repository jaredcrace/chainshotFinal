//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;
import "hardhat/console.sol";
import "contracts/Promoter.sol";

contract Event {
    string public eventName;    
    string public eventDate;
    uint public ticketNum;
    uint256[] public ticketArray;
    uint public eventId;
    address public eventAddress;
    Promoter[] promoterList;

    constructor(
      string memory _name, 
      string memory _eventDate, 
      address _address, 
      uint _ticketNum, 
      uint _eventId,
      uint[] memory _ticketArray) {
        eventName = _name;
        eventDate = _eventDate;
        eventAddress = _address;
        ticketNum = _ticketNum;
        eventId = _eventId;

        // fill the ticket array
        for(uint i=0; i<ticketNum; i++) {
            ticketArray.push(_ticketArray[i]);
        }
    }

    function addPromoter(string memory _promoterName, uint _promoterStake, address _sender) public {
        Promoter p1 = new Promoter(_promoterName, _sender, _promoterStake);
        promoterList.push(p1);
    }

    function print() public view {
      console.log("-----------------------------");
      console.log("eventName:", eventName);
      console.log("eventDate:", eventDate);
      console.log("eventAddress:", eventAddress);
      console.log("eventId:", eventId);
      console.log("ticketNum:", ticketNum);
      console.log("tickets:");
      console.log("one ticket:", ticketArray[0]);

//      for(uint i=0; i<ticketNum; i++) {
//        console.log(ticketArray[i]);
//      }

      for(uint i=0; i<promoterList.length; i++) {
          promoterList[i].print();
      }
    }
}