// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Mapping {
    // slotKey = keccak256(key, base_slot key)

    mapping (address => uint256) public map;

    address public constant ADDR_1 = address(1);
    address public constant ADDR_2 = address(2);
    address public constant ADDR_3 = address(3);

    constructor(){
        map[ADDR_1] = 100;
        map[ADDR_1] = 200;
        map[ADDR_1] = 300;
    }

    function get (address _key) public view returns (uint256 value){
        assembly{
            value := sload(keccak256(abi.encode(_key, uint256(0))))
        }
    }    
}