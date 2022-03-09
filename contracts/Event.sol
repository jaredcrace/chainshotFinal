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

    function print() public view {
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