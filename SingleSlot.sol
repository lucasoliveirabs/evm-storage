// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract SingleSlot {

    uint256 public s1; //single slot variable, 32bytes sized

    function storeNumber (uint256 val) external {
        assembly {
            sstore(s1.slot, val)
        }
    }

    function loadNumber () external view returns (bytes32 val){ //raw hex slot value
        assembly {
            val := sload(s1.slot)
        }
    }

    function loadNumberUint () external view returns (uint256 val){ //compile converted value
        assembly {
            val := sload(s1.slot)
        }
    }
}