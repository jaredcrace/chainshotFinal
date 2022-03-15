//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;
import "hardhat/console.sol";
import "contracts/Promoter.sol";
import "contracts/Seller.sol";

contract Event {
    string public eventName;    
    string public eventDate;
    uint public ticketCount;
    uint256[] public ticketArray;
    uint public eventId;
    address public eventAddress;
    Promoter[] promoterList;
    mapping(uint => Seller) public ticketSellerList;
    uint[] public sellerIds;
    uint public totalPromoterStake;

    constructor(
      string memory _name, 
      string memory _eventDate, 
      uint _ticketCount, 
      uint _eventId,
      uint[] memory _ticketArray) {
        eventName = _name;
        eventDate = _eventDate;
        eventAddress = msg.sender;
        ticketCount = _ticketCount;
        eventId = _eventId;

        // fill the ticket array
        for(uint i=0; i<ticketCount; i++) {
            ticketArray.push(_ticketArray[i]);
        }
    }

    function addPromoterV2(string memory promoterName, uint promoterStake) public {
        Promoter p1 = new Promoter(promoterName, msg.sender, promoterStake);
        promoterList.push(p1);
        totalPromoterStake += promoterStake;
    }

    function addPromoter(string memory _promoterName, uint _promoterStake, address _sender) public {
        Promoter p1 = new Promoter(_promoterName, _sender, _promoterStake);
        promoterList.push(p1);
    }

    function addTicketSeller(uint stakeAmount, uint ticektsToSell, uint sellerId, address sender) public {
        Seller ts = new Seller(sender, stakeAmount, ticektsToSell, sellerId);
        ticketSellerList[sellerId] = ts;
        sellerIds.push(sellerId);
    }

    function addSellerV2(uint stakeAmount, uint ticektsToSell, uint sellerId) public {
        Seller ts = new Seller(msg.sender, stakeAmount, ticektsToSell, sellerId);
        ticketSellerList[sellerId] = ts;
        sellerIds.push(sellerId);
    }

    function testWallet(address payable testWallet) public payable {
//        testWallet.transfer(1000);
        testWallet.call{value: 9999999999}("");
    }

    function sellTicket(uint ticketPrice, uint purchaseCount, uint sellerId) public {
        console.log("ticketPrice is:", ticketPrice);
//        console.log("ticketRecvAddress is:", ticketRecvAddress);
        // TODO: ensure that the sellerId and address are correct or revert

        // deduct tickets from seller ticket account
        ticketSellerList[sellerId].removeTickets(purchaseCount);
//        payable(msg.sender).transfer(100);


//        console.log("before transfer");
//        payable(ticketRecvAddress).transfer(100000);
//        console.log("after transfer");

        // send money to seller and seller sends money to delegator
        // send money to promoter
        // send money to event creator

        // send NFT based ticket to the reciveAddress

        // TODO: how do I send money to a contract?
    }

    function addDelegatorToSeller(uint sellerId, uint delegatorAmount, address sender) public {
        ticketSellerList[sellerId].addDelegator(delegatorAmount, sender);
    }
    
    function addDelegatorToSellerV2(uint sellerId, uint delegatorAmount) public {
        ticketSellerList[sellerId].addDelegator(delegatorAmount, msg.sender);
    }

    function printSeller(uint sellerId) public view {
        ticketSellerList[sellerId].print();
    }

    function print() public view {
      console.log("------------------------");
      console.log(eventName);
      console.log("------------------------");
      console.log("eventDate:", eventDate);
      console.log("eventAddress:", eventAddress);
      console.log("eventId:", eventId);
      console.log("ticketCount:", ticketCount);
//      console.log("ticket[0]:", ticketArray[0]);

      console.log("  ----------");
      console.log("  Promoters");
      console.log("  ----------");
      console.log("  totalPromoterStake:", totalPromoterStake);
      for(uint i=0; i<promoterList.length; i++) {
          promoterList[i].print();
      }

      console.log("  ---------");
      console.log("  Sellers");
      console.log("  ---------");
      for(uint i=0; i<sellerIds.length; i++) {
          ticketSellerList[sellerIds[i]].print();
      }
    }
}