# EVM Storage
Solidity is a strongly typed language so the most important thing regarding storage is regarding the **number of slots used** and **what values are used in those slots**;

### Code Pathway
solidity >(solc, Yul generation)> deployed EVM bytecode >(mining and bytecode execution by nodes)> blockchain state stored by nodes

### Yul
- Yul is an EVM inline assembly, Solidity and Yul are interoperability makes it interesting for EVM storage and related gas costs understanding;
- 'bytes32' is the only data type supported in Yul, the exact size of an EVM storage slot;

#### Refs
https://docs.soliditylang.org/en/v0.8.26/
https://ethereum.org/pt-br/developers/docs/
https://dittoeth.com/blog/packing