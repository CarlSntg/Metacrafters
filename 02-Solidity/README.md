# Token Smart Contract

This project is a simple token implementation in Solidity. The smart contract defines a custom token and includes basic functionalities such as minting and burning tokens. It is designed for educational purposes or as a starting point for further development of more complex token contracts.

## Features

- **Token Details:**
  - Name: Carl (CRL)
  - Abbreviation: CRL
  - Total Supply: Dynamic, starting at 0
- **Minting**: Allows authorized addresses to create new tokens, increasing both the total supply and the balance of the specified address.
- **Burning**: Allows token holders to destroy tokens, reducing their balance and the total supply.

## Functions

1. **mint(address _address, uint _value)**:
   - Increases the total supply by `_value`.
   - Adds the minted amount to `_address`'s balance.

2. **burn(address _address, uint _value)**:
   - Reduces the total supply by `_value`.
   - Deducts the burned amount from `_address`'s balance, provided they have enough tokens.

## Prerequisites

To interact with this contract, you need:
- Solidity 0.8.26
- A development environment such as [Remix IDE](https://remix.ethereum.org)

## Usage

1. Deploy the contract using a Solidity compiler.
2. Use the **mint** function to create new tokens and assign them to specific addresses.
3. Use the **burn** function to remove tokens from an address, reducing the total supply.

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/CarlSntg/Metacrafters/blob/main/LICENSE) file for details. 
