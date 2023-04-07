// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.19;

bytes4 constant SLOTMACHINE_SELECTOR = bytes4(keccak256("slotMachineLog(bytes32,bytes32,bytes32)"));
contract LogCallback {
    function logSlot(bytes32 slot, bytes32 key, bytes32 keccakResult) internal {
        // slotMachine Etch address is hardcoded here
        address(0x11119696969696969696).call(abi.encodeWithSelector(SLOTMACHINE_SELECTOR, slot, key, keccakResult));
    }

    function foo() external {
        bytes32 placeHolder = bytes32(0x0);
        logSlot(placeHolder, placeHolder, placeHolder);
    }
}
