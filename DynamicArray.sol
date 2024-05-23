// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract DynamicArray {
    // slot number of element = keccak256(base slot number (array length allocation)) 
    // + element size in slots * index of element in the array

    //keccak256(0), keccak256(0) + 1, keccak256(0) + 2
    uint256[] private arr = [10, 11, 12];

    //keccak256(1), keccak256(1), keccak256(1) + 1
    uint128[] private arr2 = [20, 21, 22];

    function getArrayAllocation (uint256 slotNumber, uint256 i) 
        external view returns (uint256 val256, uint128 val128, bytes32 valBytes, uint256 length) {
            bytes32 baseSlot = keccak256(abi.encode(slotNumber));
            
            assembly {
                length := sload(slotNumber)
                val256 := sload(add(baseSlot, i))
                val128 := val256
                valBytes := val256 
            }
    }
}