const { expect, assert } = require("chai");

// to run do the following:
// > npx hardhat test

describe("ModifyVariable", function () {
  it("should change x to 1337", async function () {
    const ModifyVariable = await ethers.getContractFactory("ModifyVariable");
    const contract = await ModifyVariable.deploy(10);
    await contract.deployed();

    // modify x from 10 to 1337 via this function!
    await contract.modifyToLeet();
    // getter for state variable x
    const newX = await contract.x();
    assert.equal(newX.toNumber(), 1337);
  });
});