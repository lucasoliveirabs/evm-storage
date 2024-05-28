// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Mapping {
    // slotKey = keccak256(key, base_slot key)

    mapping (address => uint256) public map;
    mapping (address => mapping(address => uint256)) public map2;


    address public constant ADDR_1 = address(1);
    address public constant ADDR_2 = address(2);
    address public constant ADDR_3 = address(3);

    constructor(){
        map[ADDR_1] = 100;
        map[ADDR_1] = 200;
        map[ADDR_1] = 300;

        // map2[key0, key1]
        map2[ADDR_1][ADDR_2] = 100;
        map2[ADDR_2][ADDR_3] = 200;
        map2[ADDR_3][ADDR_1] = 300;
    }

    function get (address _key) public view returns (uint256 value){
        assembly{
            value := sload(keccak256(abi.encode(_key, uint256(0))))
        }
    }    

    function getNested (address _keyO, address _key1) public view returns (uint256 value) {
        bytes32 slotKey = keccak256(abi.encode(_key1, keccak256(abi.encode(_keyO, uint256(1)))));
        assembly {
            value := sload(slotKey)
        }
    }
}