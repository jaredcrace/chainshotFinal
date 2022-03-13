//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;
import "hardhat/console.sol";
import "contracts/Delegator.sol";

contract Seller {
    address public sellerAddress;
    uint public stakeAmount;
    uint public ticketsToSell;
    uint public sellerId;
    Delegator[] delegatorList;

    constructor(address _address, uint _stakeAmount, uint _ticketsToSell, uint _sellerId) {
        sellerAddress = _address;
        stakeAmount = _stakeAmount;
        ticketsToSell = _ticketsToSell;
        sellerId = _sellerId;
    }

    function removeTickets(uint ticketsToRemove) public {
        // TODO: require that only the event address can do this
        ticketsToSell -= ticketsToRemove;
    }

    function addDelegator(uint _delegatorAmount, address _sender) public {
        Delegator dg = new Delegator(_sender, _delegatorAmount);
        delegatorList.push(dg);
    }

    function print() public view {
        console.log("  ***");
        console.log("  sellerId:", sellerId);
        console.log("  sellerAddress:", sellerAddress);
        console.log("  stakeAmount:", stakeAmount);
        console.log("  ticketsToSell:", ticketsToSell);

        console.log("    ----------");
        console.log("    Delegators");
        console.log("    ----------");

        for(uint i=0; i<delegatorList.length; i++) {
            delegatorList[i].print();
        }
    }
}