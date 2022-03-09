const { expect, assert } = require("chai");

// to run do the following:
// > npx hardhat test

describe("TicketMundo", function () {
  it("should change x to 1337", async function () {
    const TicketMundo = await ethers.getContractFactory("TicketMundo");

    // generate some random numbers for tickets
    let ticketArray = [];
    for(var i=0; i<10; i++) {
      ticketArray.push(Math.floor(Math.random() * 999999999));
    }

    console.log(ticketArray);

    const contract = await TicketMundo.deploy(10, ticketArray);
    await contract.deployed();


    // modify x from 10 to 1337 via this function!
    await contract.modifyToLeet();

    // getter for state variable x
    const newX = await contract.x();
    assert.equal(newX.toNumber(), 1337);
  });
});