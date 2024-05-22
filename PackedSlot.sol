// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract PackedSlot {

    // 32bytes auto packed by the compiler
    address public saddr;    //20bytes
    uint64 public sb;
    uint32 public sc;
    uint8 private constant BITES_PER_BYTE = 8;  //embedded in compile-time, no storage allocation

    function updateAddr (address _saddrValue) external {
        assembly {
            let slotValue := sload(saddr.slot)
            let saddrMask := not(sub(shl(160, 1), 1))

            slotValue := and(slotValue, saddrMask)
            slotValue := or(slotValue, _saddrValue)

            sstore(saddr.slot, slotValue)
        }
    }

    function updateB (uint64 _sbValue) external {
        assembly {
            let slotValue := sload(sb.slot)
            let sbMask := not(shl(mul(sb.offset, BITES_PER_BYTE), sub(shl(64, 1), 1)))

            slotValue := and(slotValue, sbMask)
            slotValue := or(slotValue, shl(mul(sb.offset, BITES_PER_BYTE), _sbValue))

            sstore(sb.slot, slotValue)
        }
    }

    function updateC (uint32 _scValue) external {
        assembly {
            let slotValue := sload(sc.slot)
            let scMask := not(shl(mul(sc.offset, BITES_PER_BYTE), sub(shl(32, 1), 1)))

            slotValue := and(slotValue, scMask)
            slotValue := or(slotValue, shl(mul(sc.offset, BITES_PER_BYTE), _scValue))

            sstore(sc.slot, slotValue) 
        }
    }
}