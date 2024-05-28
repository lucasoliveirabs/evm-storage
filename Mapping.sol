// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Mapping {
    // slotKey = keccak256(key, base_slot key)

    mapping (address => uint256) public map;
    mapping (address => mapping(address => uint256)) public map2;
    mapping (address => uint256[]) private map3;

    address public constant ADDR_1 = address(1);
    address public constant ADDR_2 = address(2);
    address public constant ADDR_3 = address(3);

    constructor(){
        map[ADDR_1] = 10;
        map[ADDR_2] = 20;
        map[ADDR_3] = 30;

        // map2[key0, key1]
        map2[ADDR_1][ADDR_2] = 100;
        map2[ADDR_2][ADDR_3] = 200;
        map2[ADDR_3][ADDR_1] = 300;

        map3[ADDR_1].push(1000);
        map3[ADDR_2].push(2000);
        map3[ADDR_3].push(3000);
    }

    function getSimple (address _key) public view returns (uint256 value){
        bytes32 slotKey = keccak256(abi.encode(_key, uint256(0)));
        assembly {
            value := sload(slotKey)
        }
    }    

    function getNested (address _keyO, address _key1) public view returns (uint256 value) {
        bytes32 slotKey = keccak256(abi.encode(_key1, keccak256(abi.encode(_keyO, uint256(1)))));
        assembly {
            value := sload(slotKey)
        }
    }

    function getMappingArray (address _key, uint256 _i) public view returns (uint256 length, uint256 value) {
        bytes32 mapElementKey = keccak256(abi.encode(_key, uint256(2)));
        bytes32 finalElementKey = keccak256(abi.encode(mapElementKey));
        assembly {
            length := sload(mapElementKey)
            value := sload(add(finalElementKey, _i))
        }
    }
}