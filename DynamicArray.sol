// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract DynamicArray {
    // slotKey = keccak256(base_slot key) + element size in slots * index of element in the array

    //keccak256(0), keccak256(0) + 1, keccak256(0) + 2
    uint256[] private arr = [10, 11, 12];

    //keccak256(1), keccak256(1), keccak256(1) + 1
    uint128[] private arr2 = [20, 21, 22];

    //keccak256(1) + 0,5*0, keccak256(1) + 0,5*1, keccak256(1) + 0,5*2, keccak256(1) + 0,5*3, 
        //keccak256(1) + 0,5*4, keccak256(1) + 0,5*5, keccak256(1) + 0,5*6, keccak256(1) + 0,5*7
    //keccak256(1), keccak256(1), keccak256(1) + 1, keccak256(1) + 1, keccak256(1) + 2, keccak256(1) + 2, keccak256(1) + 3
    uint128[] private arr2 = [20, 21, 22, 23, 24, 25, 26];


    function get (uint256 _baseSlotKey, uint256 _i) 
        external view returns (uint256 val256, uint128 val128, bytes32 valBytes, uint256 length) {
            bytes32 encodedBaseSlotKey = keccak256(abi.encode(_baseSlotKey));
            
            assembly {
                length := sload(_baseSlotKey)
                val256 := sload(add(encodedBaseSlotKey, _i))
                val128 := val256
                valBytes := val256 
            }
    }
}