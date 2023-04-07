// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "../src/SlotMachine.sol";

interface ICounter {
    function setBalance() external;
}

contract CounterStorageTest is SlotMachine {
    ICounter exampleContract;

    function setUp() public override {
        // setup SlotMachine
        super.setUp();
        // define the storage slot are 'OK' to be used by the target contract
        bytes32 defaultSlot = keccak256("counter.storage");
        slotWhitelist(defaultSlot, 100);

        // name of target contract
        string memory name = "Counter";
        // get the bytecode of the target contract, depliyed at this address
        exampleContract = ICounter(deployContract(name));
    }

    // write your tests here
    function testMapping() public useSlotMachine(address(exampleContract)) {
        exampleContract.setBalance();
    }
}
