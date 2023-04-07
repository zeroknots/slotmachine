// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "openzeppelin-contracts/contracts/utils/Strings.sol";

struct SSTORELog {
    bytes32 slot;
    bytes32 value;
    bytes32 keccak256Slot;
    uint256 blockNumber;
}

abstract contract StorageBuster is Test {
    SSTORELog[] public allLogs;
    StorageBuster storageBuster;

    bytes32[] public whitelistedSlots;

    address target;

    function getAllLogs() external returns (SSTORELog[] memory) {
        return allLogs;
    }

    modifier useSTORELog(address _target) {
        target = _target;
        _;
        for (uint256 i = 0; i < storageBuster.getAllLogs().length; i++) {
            printLog(i);
        }
    }

    function setUp() public virtual {
        bytes memory code = address(this).code;
        address targetAddr = address(0x9696969696);
        vm.etch(targetAddr, code);
        vm.record();
        storageBuster = StorageBuster(targetAddr);

    }

    function logSSTORE(bytes32 _slot, bytes32 _key, bytes32 _keccakResult) external {
        SSTORELog memory log = SSTORELog(_slot, _key, _keccakResult, block.number);
        allLogs.push(log);
    }

    function whitelistStorage(bytes32 slot) public {
        whitelistedSlots.push(slot);
        for (uint256 i = 0; i < 100; i++) {
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
        SSTORELog[] memory logs = storageBuster.getAllLogs();
        for (uint256 i = 0; i < logs.length; i++) {
            SSTORELog memory log = logs[i];

            string memory valueStr = Strings.toHexString(uint256(log.value), 32);
            string memory slotStr = Strings.toHexString(uint256(log.slot), 32);
            string memory keccakStr = Strings.toHexString(uint256(log.keccak256Slot), 32);

            console2.log("\n\n--------");
            if (isAllowedSlot(log.slot)) {
                console2.log("\n[SLOT] %s \n[VALUE] %s \n=> [keccack] %s [!OK!]", slotStr, valueStr, keccakStr);
                whitelistedSlots.push(log.keccak256Slot);
            } else {
                console2.log("\n[SLOT] %s \n[VALUE] %s \n=> [keccack] %s [!ALERT!]", slotStr, valueStr, keccakStr);
                revert SSTORE_ALERT_SLOT(log.keccak256Slot);
            }
        }
    }
    error SSTORE_ALERT_SLOT(bytes32 slot);
}
