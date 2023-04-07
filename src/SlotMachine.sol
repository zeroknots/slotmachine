// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "openzeppelin-contracts/contracts/utils/Strings.sol";

struct SlotMachineLog {
    bytes32 slot;
    bytes32 value;
    bytes32 keccak256Slot;
    uint256 blockNumber;
}


address constant SLOTMACHINE_ETCH_ADDR = address(0x11119696969696969696);

abstract contract SlotMachine is Test {
    SlotMachineLog[] public allLogs;
    SlotMachine slotmachine;

    bytes32[] public whitelistedSlots;

    address target;

    function deployBytecode(bytes memory _bytecode) public returns (address) {
        address contractAddress;
        assembly {
            contractAddress := create(0, add(_bytecode, 0x20), mload(_bytecode))
        }
        return contractAddress;
    }

    function deployContract(string memory name) public returns (address) {
        // _1337 will be added to all the yul objects in the 'backdoored' yul contract
        string memory bytecodeIdentifier = ".yul:Counter_1337";
        bytes memory bytecode = abi.encodePacked(vm.getCode(string(abi.encodePacked(name, bytecodeIdentifier))));
        address contractAddress = deployBytecode(bytecode);
        return contractAddress;
    }

    function getAllLogs() external view returns (SlotMachineLog[] memory) {
        return allLogs;
    }

    modifier useSlotMachine(address _target) {
        target = _target;
        _;
        for (uint256 i = 0; i < slotmachine.getAllLogs().length; i++) {
            printLog(i);
        }
    }

    function setUp() public virtual {
        bytes memory code = address(this).code;
        address targetAddr = SLOTMACHINE_ETCH_ADDR;
        vm.etch(targetAddr, code);
        vm.record();
        slotmachine = SlotMachine(targetAddr);
    }

    /**
     * Callback function that will be called by the target contract
     * @param _slot EVM storage base slot
     * @param _key  EVM storage key
     * @param _keccakResult  keccak256(_slot, _key)
     */
    function slotMachineLog(bytes32 _slot, bytes32 _key, bytes32 _keccakResult) external {
        SlotMachineLog memory log = SlotMachineLog(_slot, _key, _keccakResult, block.number);
        allLogs.push(log);
    }

    function slotWhitelist(bytes32 slot, uint256 offset) public {
        whitelistedSlots.push(slot);
        for (uint256 i = 0; i < offset; i++) {
            bytes32 nextSlot;
            assembly {
                nextSlot := add(slot, i)
            }
            whitelistedSlots.push(nextSlot);
        }
    }

    function isSlotInVMRecord(bytes32 slot) public returns (bool) {
        (, bytes32[] memory writeSlots) = vm.accesses(target);
        for (uint256 i = 0; i < writeSlots.length; i++) {
            if (writeSlots[i] == slot) {
                return true;
            }
        }
        return false;
    }

    function isAllowedSlot(bytes32 slot) internal returns (bool) {
        for (uint256 i = 0; i < whitelistedSlots.length; i++) {
            if (whitelistedSlots[i] == slot) {
                return true;
            }
        }
        return false;
    }

    function printLog(uint256 index) public {
        SlotMachineLog[] memory logs = slotmachine.getAllLogs();
        for (uint256 i = 0; i < logs.length; i++) {
            SlotMachineLog memory log = logs[i];

            string memory valueStr = Strings.toHexString(uint256(log.value), 32);
            string memory slotStr = Strings.toHexString(uint256(log.slot), 32);
            string memory keccakStr = Strings.toHexString(uint256(log.keccak256Slot), 32);

            console2.log("\n\n--------");
            if (isAllowedSlot(log.slot)) {
                console2.log("\n[SLOT] %s \n[VALUE] %s \n=> [keccack] %s [!OK!]", slotStr, valueStr, keccakStr);
                whitelistedSlots.push(log.keccak256Slot);
            } else {
                console2.log("\n[SLOT] %s \n[VALUE] %s \n=> [keccack] %s [!ALERT!]", slotStr, valueStr, keccakStr);
                revert SLOTMACHINE_SSTORE_ALERT(log.keccak256Slot);
            }
        }
    }

    error SLOTMACHINE_SSTORE_ALERT(bytes32 slot);
}
