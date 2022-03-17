const { expect, assert } = require("chai");
const { ethers } = require("hardhat");
require('dotenv').config();

// to run do the following:
// > npx hardhat test

describe("TicketMundo", function () {
  /*
  beforeEach(async () => {
    console.log("----inside beforeEach");
  });
  */

  /*
  it("wallet play", async function () {
    const url = process.env.RINKEBY_URL;
    const provider = new ethers.providers.JsonRpcProvider(url);
    let privateKey = process.env.PRIVATE_KEY;
    let wallet = new ethers.Wallet(privateKey, provider);
  });
  */

  it("eventId should be correct", async function () {
    const EventMundo = await ethers.getContractFactory("Event");
    const [
      owner, 
      addr1, 
      addr2, 
      addr3, 
      addr4, 
      addr5, 
      addr6, 
      addr7,
      addr8,
      addr9] = await ethers.getSigners();

    const eventId = 3343;
    const ticketCount = 50;
    const sellerId_1 = 0x3;
    const sellerId_2 = 0x4;

    // generate some random numbers for tickets
    let ticketArray = [];
    for(var i=0; i<ticketCount; i++) {
      ticketArray.push(Math.floor(Math.random() * 999999999));
    }

    const contractEventMundo = await EventMundo.deploy("Justin Bieber World Tour",
                                                        "Wed Aug 3, 2022",
                                                        ticketCount,
                                                        eventId,
                                                        ticketArray);
    await contractEventMundo.deployed();
    const ans = await contractEventMundo.eventId();

    assert.equal(eventId, ans);
  });

  it("promoter amount should be correct", async function () {
    const EventMundo = await ethers.getContractFactory("Event");
    const [
      owner, 
      addr1, 
      addr2, 
      addr3, 
      addr4, 
      addr5, 
      addr6, 
      addr7,
      addr8,
      addr9] = await ethers.getSigners();

    const eventId = 3343;
    const ticketCount = 50;
    const sellerId_1 = 0x3;
    const sellerId_2 = 0x4;

    // generate some random numbers for tickets
    let ticketArray = [];
    for(var i=0; i<ticketCount; i++) {
      ticketArray.push(Math.floor(Math.random() * 999999999));
    }

    const contractEventMundo = await EventMundo.deploy("Justin Bieber World Tour",
                                                        "Wed Aug 3, 2022",
                                                        ticketCount,
                                                        eventId,
                                                        ticketArray);
    await contractEventMundo.deployed();
    await contractEventMundo.connect(addr1).addPromoterV2("Live Nation", 55555);
    const ans = await contractEventMundo.returnPromoterStake();
    assert.equal(55555, ans);
  });

   it("delegator stake amount should be correct", async function () {
    const EventMundo = await ethers.getContractFactory("Event");
    const [
      owner, 
      addr1, 
      addr2, 
      addr3, 
      addr4, 
      addr5, 
      addr6, 
      addr7,
      addr8,
      addr9] = await ethers.getSigners();

    const eventId = 3343;
    const ticketCount = 50;
    const sellerId_1 = 0x3;
    const sellerId_2 = 0x4;

    // generate some random numbers for tickets
    let ticketArray = [];
    for(var i=0; i<ticketCount; i++) {
      ticketArray.push(Math.floor(Math.random() * 999999999));
    }

    const contractEventMundo = await EventMundo.deploy("Justin Bieber World Tour",
                                                        "Wed Aug 3, 2022",
                                                        ticketCount,
                                                        eventId,
                                                        ticketArray);
    await contractEventMundo.deployed();

    await contractEventMundo.connect(addr1).addPromoterV2("Live Nation", 55555);
    await contractEventMundo.connect(addr2).addPromoterV2("SONY", 4444);
    await contractEventMundo.connect(addr3).addPromoterV2("AEG", 666666);

    await contractEventMundo.connect(addr4).addSellerV2(1000, 25, sellerId_1);
    await contractEventMundo.connect(addr5).addSellerV2(1000, 20, sellerId_2);

    await contractEventMundo.connect(addr6).addDelegatorToSellerV2(sellerId_1, 250);
    const ans = await contractEventMundo.returnDelegatorStake(sellerId_1);

    assert.equal(250, ans);
  });

  it("ticket count should decrement after a sell", async function () {
    const EventMundo = await ethers.getContractFactory("Event");
    const [
      owner, 
      addr1, 
      addr2, 
      addr3, 
      addr4, 
      addr5, 
      addr6, 
      addr7,
      addr8,
      addr9] = await ethers.getSigners();

    const eventId = 3343;
    const ticketCount = 50;
    const sellerId_1 = 0x3;
    const sellerId_2 = 0x4;

    // generate some random numbers for tickets
    let ticketArray = [];
    for(var i=0; i<ticketCount; i++) {
      ticketArray.push(Math.floor(Math.random() * 999999999));
    }

    const contractEventMundo = await EventMundo.deploy("Justin Bieber World Tour",
                                                        "Wed Aug 3, 2022",
                                                        ticketCount,
                                                        eventId,
                                                        ticketArray);
    await contractEventMundo.deployed();

    await contractEventMundo.connect(addr1).addPromoterV2("Live Nation", 55555);
    await contractEventMundo.connect(addr2).addPromoterV2("SONY", 4444);
    await contractEventMundo.connect(addr3).addPromoterV2("AEG", 666666);

    await contractEventMundo.connect(addr4).addSellerV2(1000, 25, sellerId_1);
    await contractEventMundo.connect(addr5).addSellerV2(1000, 20, sellerId_2);

    await contractEventMundo.connect(addr6).addDelegatorToSellerV2(sellerId_1, 250);
    await contractEventMundo.connect(addr7).addDelegatorToSellerV2(sellerId_2, 400);
    await contractEventMundo.connect(addr8).addDelegatorToSellerV2(sellerId_2, 100);

    await contractEventMundo.print();

    // make a sell from Node
    await contractEventMundo.connect(addr4).sellTicket(25, 2, sellerId_1);
    await contractEventMundo.printSeller(sellerId_1);

    const retTicketCount = await contractEventMundo.returnSellerTicketCount(sellerId_1);
    console.log(retTicketCount);
    const ans = ethers.BigNumber.from("23");

    assert.isTrue(retTicketCount.eq(ans));
//    assert.equal(retTicketCount, ans);
  });

});