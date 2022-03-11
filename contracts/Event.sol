//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;
import "hardhat/console.sol";
import "contracts/Promoter.sol";
import "contracts/Seller.sol";

contract Event {
    string public eventName;    
    string public eventDate;
    uint public ticketNum;
    uint256[] public ticketArray;
    uint public eventId;
    address public eventAddress;
    Promoter[] promoterList;
    Seller[] ticketSellerList;

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

    function addTicketSeller(uint _stakeAmount, uint _ticektsToSell, uint _sellerId, address _sender) public {
        Seller ts = new Seller(_sender, _stakeAmount, _ticektsToSell, _sellerId);
        ticketSellerList.push(ts);
    }

    function addDelegatorToSeller(uint _sellerId, uint _delegatorAmount, address _sender) public {
        // first, find the Seller
        // TODO: add a revert check here
        for(uint i=0; i<ticketSellerList.length; i++){
            if(ticketSellerList[i].sellerId() == _sellerId) {
                ticketSellerList[i].addDelegator(_delegatorAmount, _sender);
            }
        }
    }

    function print() public view {
      console.log("----------Event---------------");
      console.log("eventName:", eventName);
      console.log("eventDate:", eventDate);
      console.log("eventAddress:", eventAddress);
      console.log("eventId:", eventId);
      console.log("ticketNum:", ticketNum);
      console.log("ticket[0]:", ticketArray[0]);

//      for(uint i=0; i<ticketNum; i++) {
//        console.log(ticketArray[i]);
//      }

      for(uint i=0; i<promoterList.length; i++) {
          promoterList[i].print();
      }

      for(uint i=0; i<ticketSellerList.length; i++) {
          ticketSellerList[i].print();
      }
    }
}