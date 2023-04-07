// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

struct Data {
    uint256 number;
    uint256[] numbers;
}

library CounterStorage {
    // 0x0bec8ab077af1e12783ac8c970bca6dada042613c1ff87b4d0953dea6b0115fd
    bytes32 constant STORAGE_POSITION = keccak256("counter.storage");

    struct Foobar {
        uint256 number;
        mapping(address owner => uint256) balances;
        mapping(uint256 foo => bool) bla;
        mapping(uint256 bar => address) baz;
        mapping(uint256 foo => mapping(uint256 bar => Data)) blub;
    }

    function storageReference() internal pure returns (Foobar storage s) {
        bytes32 position = STORAGE_POSITION;
        assembly {
            s.slot := position
        }
    }
}

contract Counter {
    function setNumber(uint256 newNumber) public {
        CounterStorage.storageReference().number = newNumber;
    }

    function setBalance() public {
        CounterStorage.storageReference().balances[address(0x1234)] = 0xdeadbeef;
        CounterStorage.storageReference().blub[0][0].number = 0xdeadbeef;

        CounterStorage.Foobar storage s;
        bytes32 position = keccak256("diamond.storage");
        assembly {
            s.slot := position
        }
        s.balances[address(0x77777)] = 0xdeadbeef;
    }
}
