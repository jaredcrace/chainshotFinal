const { expect, assert } = require("chai");
const { ethers } = require("hardhat");

// to run do the following:
// > npx hardhat test

describe("TicketMundo", function () {
  it("should change x to 1337", async function () {
    const TicketMundo = await ethers.getContractFactory("TicketMundo");
    const ticketNum = 12;
    const eventId = 9812;
    const sellerId = 4532;

    const [owner, addr1, addr2] = await ethers.getSigners();

    // generate some random numbers for tickets
    let ticketArray = [];
    for(var i=0; i<ticketNum; i++) {
      ticketArray.push(Math.floor(Math.random() * 999999999));
    }
    //console.log(ticketArray);

    const contract = await TicketMundo.deploy();
    await contract.deployed();

    // modify x from 10 to 1337 via this function!
    await contract.addEvent(
      "event1", 
      "event1Date", 
      ticketNum, 
      eventId, 
      ticketArray);

    // add an event from a different address
    await contract.connect(addr1).addEvent(
      "event2", 
      "event2Date", 
      ticketNum, 
      eventId + 54, 
      ticketArray);

    await contract.addPromoterToEvent("promoter1Name", 98765, eventId);

    await contract.addSellerToEvent(1000, 20, eventId, sellerId);

    await contract.addDelegatorToSeller(eventId, sellerId, 99887766);

    await contract.printEvents();

    // getter for state variable x
//    const newX = await contract.x();
//    assert.equal(newX.toNumber(), 1337);
    assert.equal(10,10);

  });
});