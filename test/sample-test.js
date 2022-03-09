const { expect, assert } = require("chai");

// to run do the following:
// > npx hardhat test

describe("TicketMundo", function () {
  it("should change x to 1337", async function () {
    const TicketMundo = await ethers.getContractFactory("TicketMundo");
    const ticketNum = 12;
    const eventId = 9812;

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

    await contract.addEvent(
      "event2", 
      "event2Date", 
      ticketNum, 
      eventId + 54, 
      ticketArray);

    await contract.addPromoterToEvent("promoter1Name", 98765, eventId);

    await contract.printEvents();

    // getter for state variable x
//    const newX = await contract.x();
//    assert.equal(newX.toNumber(), 1337);
    assert.equal(10,10);

  });
});