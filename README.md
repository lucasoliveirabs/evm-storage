# EVM Storage
Solidity is a strongly typed language so the most important thing regarding storage is regarding the **number of slots used** and **what values are used in those slots**. 
EVM storage slots are mapped based on key-value pattern by contract, where key value is defined as a 0-n integer (fixed size data types) or a combination of keccak256(variable declaration slot key) + index/mappingKey.

### Smart Contract Deployment Pipeline
solidity >(solc, Yul generation)> deployed EVM bytecode >(mining and bytecode execution by nodes)> blockchain state stored by nodes

### Yul
- Yul is an EVM inline assembly, Solidity and Yul are interoperability makes it interesting for EVM storage and related gas costs understanding;
- 'bytes32' is the only data type supported in Yul, the exact size of an EVM storage slot

                        -real DeFi industry bitwise manually usage scenarios and cases

### Fixed vs Dynamic Sized Data Types
- Strongly typed Solidity makes each contract storage slot allocation predictable for fixed size variables;
- In dynamic sized data types cases a base slot is allocated for length value when a variable is initialized and different slots for the new values according to a combination of a keccak256 of the base slot, element size and index/key

| Fixed | Dynamic |
| ------ | ------ |
| Sequencial keys/allocation | Keys/allocation based on keccak256(base slot) + index/mappingKey combination |
| No length allocation (compile time)  | Length allocation (base slot, key follows contract's sequential slot allocation) |

- Dynamic arrays: slot key = keccak256(base_slot key) + (element size in slots * index of element in the array)
- Mapping: slot key = keccak256(key, base_lot key)

#### Main Refs
https://docs.soliditylang.org/en/v0.8.26/
https://ethereum.org/pt-br/developers/docs/
https://dittoeth.com/blog/packing