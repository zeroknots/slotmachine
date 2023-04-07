
/// @use-src 0:"src/Counter.sol"
object "Counter_1337" {
    code {
        /// @src 0:734:1281  "contract Counter {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_Counter_1337()

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("Counter_1337_deployed"), datasize("Counter_1337_deployed"))

        return(_1, datasize("Counter_1337_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @src 0:734:1281  "contract Counter {..."
        function constructor_Counter_1337() {

            /// @src 0:734:1281  "contract Counter {..."

        }
        /// @src 0:734:1281  "contract Counter {..."

    }
    /// @use-src 0:"src/Counter.sol"
    object "Counter_1337_deployed" {
        code {
function fun__logSlot_1337(var_slot_49, var_key_51, var_keccakresult_53) {

                /// @src 0:805:817  "0x9696969696"
                let expr_60 := 0x9696969696
                /// @src 0:797:818  "address(0x9696969696)"
                let expr_61 := expr_60 
                /// @src 0:776:818  "address logAddress = address(0x9696969696)"
                let var_logAddress_57 := expr_61
                /// @src 0:854:901  "keccak256(\"logSSTORE(bytes32,bytes32,bytes32)\")"
                let expr_69 := 0x246e185ecff0abf4413189a686037d9e0d3cfcd779c1c323cafba215b05098b1
                /// @src 0:847:902  "bytes4(keccak256(\"logSSTORE(bytes32,bytes32,bytes32)\"))"
                // let expr_70 := convert_t_bytes32_to_t_bytes4(expr_69)
                let expr_70 := and(expr_69, 0xffffffff00000000000000000000000000000000000000000000000000000000)
                /// @src 0:829:902  "bytes4 selector = bytes4(keccak256(\"logSSTORE(bytes32,bytes32,bytes32)\"))"
                let var_selector_64 := expr_70
                /// @src 0:912:1250  "assembly {..."
                {
                    let usr$ptr := mload(0x40)
                    mstore(usr$ptr, var_selector_64)
                    mstore(add(usr$ptr, 0x04), var_slot_49)
                    mstore(add(usr$ptr, 0x24), var_key_51)
                    mstore(add(usr$ptr, 0x44), var_keccakresult_53)
                    let usr$success := call(gas(), var_logAddress_57, 0, usr$ptr, 0x64, 0, 0)
                    if iszero(usr$success) { revert(0, 0) }
                }

            }

          
            /// @src 0:734:1281  "contract Counter {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x1a61746e
                {
                    // setBalance()

                    external_fun_setBalance_115()
                }

                case 0x3fb5c1cb
                {
                    // setNumber(uint256)

                    external_fun_setNumber_61()
                }

                default {}
            }

            revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74()

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function allocate_unbounded() -> memPtr {
                memPtr := mload(64)
            }

            function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
                revert(0, 0)
            }

            function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() {
                revert(0, 0)
            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function external_fun_setBalance_115() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                fun_setBalance_115()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
                revert(0, 0)
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_setNumber_61() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                fun_setNumber_61(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
            }

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

            }

            function update_byte_slice_32_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function identity(value) -> ret {
                ret := value
            }

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_uint256(value)))
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            /// @ast-id 61
            /// @src 0:757:871  "function setNumber(uint256 newNumber) public {..."
            function fun_setNumber_61(var_newNumber_49) {

                /// @src 0:855:864  "newNumber"
                let _1 := var_newNumber_49
                let expr_57 := _1
                /// @src 0:812:826  "CounterStorage"
                let expr_52_address := linkersymbol("src/Counter.sol:CounterStorage")
                /// @src 0:812:845  "CounterStorage.storageReference()"
                let expr_55_slot := fun_storageReference_46()
                /// @src 0:812:852  "CounterStorage.storageReference().number"
                let _2 := add(expr_55_slot, 0)
                /// @src 0:812:864  "CounterStorage.storageReference().number = newNumber"
                update_storage_value_offset_0t_uint256_to_t_uint256(_2, expr_57)
                let expr_58 := expr_57

            }
            /// @src 0:734:1281  "contract Counter {..."

            /// @src 0:221:285  "bytes32 constant STORAGE_POSITION = keccak256(\"counter.storage\")"
            function constant_STORAGE_POSITION_12() -> ret {
                /// @src 0:257:285  "keccak256(\"counter.storage\")"
                let expr_11 := 0x0bec8ab077af1e12783ac8c970bca6dada042613c1ff87b4d0953dea6b0115fc
                let _3 := expr_11

                ret := _3
            }

            /// @ast-id 46
            /// @src 0:549:730  "function storageReference() internal pure returns (Foobar storage s) {..."
            function fun_storageReference_46() -> var_s_38_slot {

                /// @src 0:647:663  "STORAGE_POSITION"
                let expr_42 := constant_STORAGE_POSITION_12()
                /// @src 0:628:663  "bytes32 position = STORAGE_POSITION"
                let var_position_41 := expr_42
                /// @src 0:673:724  "assembly {..."
                {
                    var_s_38_slot := var_position_41
                }

            }
            /// @src 0:734:1281  "contract Counter {..."

            function cleanup_t_rational_3735928559_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_3735928559_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_3735928559_by_1(value)))
            }

            function cleanup_t_rational_4660_by_1(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function convert_t_rational_4660_by_1_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(identity(cleanup_t_rational_4660_by_1(value)))
            }

            function convert_t_rational_4660_by_1_to_t_address(value) -> converted {
                converted := convert_t_rational_4660_by_1_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(identity(cleanup_t_uint160(value)))
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
				dataSlot := keccak256(0, 0x40)
				fun__logSlot_1337(slot,key,dataSlot)
            }

            function cleanup_t_rational_0_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_0_by_1(value)))
            }

            function mapping_index_access_t_mapping$_t_uint256_$_t_mapping$_t_uint256_$_t_struct$_Data_$7_storage_$_$_of_t_rational_0_by_1(slot , key) -> dataSlot {
                mstore(0, convert_t_rational_0_by_1_to_t_uint256(key))
                mstore(0x20, slot)
				dataSlot := keccak256(0, 0x40)
				fun__logSlot_1337(slot,key,dataSlot)
            }

            function mapping_index_access_t_mapping$_t_uint256_$_t_struct$_Data_$7_storage_$_of_t_rational_0_by_1(slot , key) -> dataSlot {
                mstore(0, convert_t_rational_0_by_1_to_t_uint256(key))
                mstore(0x20, slot)
				dataSlot := keccak256(0, 0x40)
				fun__logSlot_1337(slot,key,dataSlot)
            }

            function cleanup_t_rational_489335_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_489335_by_1_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(identity(cleanup_t_rational_489335_by_1(value)))
            }

            function convert_t_rational_489335_by_1_to_t_address(value) -> converted {
                converted := convert_t_rational_489335_by_1_to_t_uint160(value)
            }

            /// @ast-id 115
            /// @src 0:877:1279  "function setBalance() public {..."
            function fun_setBalance_115() {

                /// @src 0:978:988  "0xdeadbeef"
                let expr_74 := 0xdeadbeef
                /// @src 0:916:988  "CounterStorage.storageReference().balances[address(0x1234)] = 0xdeadbeef"
                let _4 := convert_t_rational_3735928559_by_1_to_t_uint256(expr_74)
                /// @src 0:916:930  "CounterStorage"
                let expr_64_address := linkersymbol("src/Counter.sol:CounterStorage")
                /// @src 0:916:949  "CounterStorage.storageReference()"
                let expr_67_slot := fun_storageReference_46()
                /// @src 0:916:958  "CounterStorage.storageReference().balances"
                let _5 := add(expr_67_slot, 1)
                let _6_slot := _5
                let expr_68_slot := _6_slot
                /// @src 0:967:973  "0x1234"
                let expr_71 := 0x1234
                /// @src 0:959:974  "address(0x1234)"
                let expr_72 := convert_t_rational_4660_by_1_to_t_address(expr_71)
                /// @src 0:916:975  "CounterStorage.storageReference().balances[address(0x1234)]"
                let _7 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_68_slot,expr_72)
                /// @src 0:916:988  "CounterStorage.storageReference().balances[address(0x1234)] = 0xdeadbeef"
                update_storage_value_offset_0t_uint256_to_t_uint256(_7, _4)
                let expr_75 := _4
                /// @src 0:1052:1062  "0xdeadbeef"
                let expr_87 := 0xdeadbeef
                /// @src 0:998:1062  "CounterStorage.storageReference().blub[0][0].number = 0xdeadbeef"
                let _8 := convert_t_rational_3735928559_by_1_to_t_uint256(expr_87)
                /// @src 0:998:1012  "CounterStorage"
                let expr_77_address := linkersymbol("src/Counter.sol:CounterStorage")
                /// @src 0:998:1031  "CounterStorage.storageReference()"
                let expr_80_slot := fun_storageReference_46()
                /// @src 0:998:1036  "CounterStorage.storageReference().blub"
                let _9 := add(expr_80_slot, 4)
                let _10_slot := _9
                let expr_81_slot := _10_slot
                /// @src 0:1037:1038  "0"
                let expr_82 := 0x00
                /// @src 0:998:1039  "CounterStorage.storageReference().blub[0]"
                let _11 := mapping_index_access_t_mapping$_t_uint256_$_t_mapping$_t_uint256_$_t_struct$_Data_$7_storage_$_$_of_t_rational_0_by_1(expr_81_slot,expr_82)
                let _12_slot := _11
                let expr_83_slot := _12_slot
                /// @src 0:1040:1041  "0"
                let expr_84 := 0x00
                /// @src 0:998:1042  "CounterStorage.storageReference().blub[0][0]"
                let _13 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_Data_$7_storage_$_of_t_rational_0_by_1(expr_83_slot,expr_84)
                let _14_slot := _13
                let expr_85_slot := _14_slot
                /// @src 0:998:1049  "CounterStorage.storageReference().blub[0][0].number"
                let _15 := add(expr_85_slot, 0)
                /// @src 0:998:1062  "CounterStorage.storageReference().blub[0][0].number = 0xdeadbeef"
                update_storage_value_offset_0t_uint256_to_t_uint256(_15, _8)
                let expr_88 := _8
                /// @src 0:1073:1104  "CounterStorage.Foobar storage s"
                let var_s_94_slot
                /// @src 0:1133:1161  "keccak256(\"diamond.storage\")"
                let expr_100 := 0x2031468f0c30f7087de4da9398818763b546d7f89935fa65485c24ff1df26bf3
                /// @src 0:1114:1161  "bytes32 position = keccak256(\"diamond.storage\")"
                let var_position_97 := expr_100
                /// @src 0:1171:1222  "assembly {..."
                {
                    var_s_94_slot := var_position_97
                }
                /// @src 0:1262:1272  "0xdeadbeef"
                let expr_111 := 0xdeadbeef
                /// @src 0:1231:1272  "s.balances[address(0x77777)] = 0xdeadbeef"
                let _16 := convert_t_rational_3735928559_by_1_to_t_uint256(expr_111)
                /// @src 0:1231:1232  "s"
                let _17_slot := var_s_94_slot
                let expr_103_slot := _17_slot
                /// @src 0:1231:1241  "s.balances"
                let _18 := add(expr_103_slot, 1)
                let _19_slot := _18
                let expr_109_slot := _19_slot
                /// @src 0:1250:1257  "0x77777"
                let expr_107 := 0x077777
                /// @src 0:1242:1258  "address(0x77777)"
                let expr_108 := convert_t_rational_489335_by_1_to_t_address(expr_107)
                /// @src 0:1231:1259  "s.balances[address(0x77777)]"
                let _20 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_109_slot,expr_108)
                /// @src 0:1231:1272  "s.balances[address(0x77777)] = 0xdeadbeef"
                update_storage_value_offset_0t_uint256_to_t_uint256(_20, _16)
                let expr_112 := _16

            }
            /// @src 0:734:1281  "contract Counter {..."

        }

        data ".metadata" hex"a2646970667358221220257b08590fc1e514d4cb4dab4407d52d6bf5fe284b14076327bd6ba1049eabdb64736f6c63430008130033"
    }

}

