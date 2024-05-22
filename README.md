# ethereum-studies

## EVM Storage
solidity >(solc)> deployed EVM bytecode >(mining and bytecode execution by nodes)> blockchain state stored by nodes

#### Yul
- Yul is an EVM intermediate representation language, inline assembly, interesting for understanding EVM storage optimization and gas costs management;
- The only data type supported in Yul is bytes32, the exact size of an EVM storage slot;
- The most important thing regarding storage is regarding the *number of slots used* and *what values are used in those slots*;

#### Refs
https://docs.soliditylang.org/en/v0.8.26/
https://ethereum.org/pt-br/developers/docs/
https://dittoeth.com/blog/packing