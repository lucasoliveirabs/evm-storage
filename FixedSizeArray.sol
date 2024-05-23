// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract FixedSizeArray {
    uint256[5] private arr_0;
    uint256[3] private arr_1;
    uint64[5] private arr_2;

    function get_arr_1(uint256 i) public view returns (uint256 v) {
        assembly {
            v := sload(add(5, i))
        }
    }

    function get_arr_2(uint256 i) public view returns (uint64 v) {
        assembly {
            let slotValue := sload(add(8, div(i, 4))) 
            
            switch mod(i, 4)
            case 0 { v := b32 }
            case 1 { v := shr(64, slotValue) }
            case 2 { v := shr(128, slotValue) }
            default { v := shr(192, slotValue) }
        }
    }
}