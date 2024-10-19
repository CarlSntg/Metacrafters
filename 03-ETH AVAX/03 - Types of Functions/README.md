# MyToken (ERC20 Token Contract)

## Overview
This project is an ERC20 token contract written in Solidity, implementing basic token functionality such as minting, burning, and transferring tokens. The contract is designed to showcase ownership control through the use of a modifier, where only the contract owner can mint new tokens. This project is built using OpenZeppelin's ERC20 standard, ensuring security and best practices.

## Features
- Mint new tokens (restricted to the contract owner).
- Burn tokens (accessible to any token holder).
- Transfer tokens between accounts (inherited from the ERC20 standard).

## Functions
### `constructor(string memory name, string memory symbol)`
The constructor initializes the token with a name and symbol, mints 100 tokens to the deployer, and sets the deployer as the contract owner.

### `mint(address to, uint256 amount)`
Allows the owner to mint new tokens and send them to the specified `to` address. This function is restricted using the `onlyOwner` modifier, ensuring that only the contract owner can mint tokens.

### `burn(uint256 amount)`
Allows any user to burn (destroy) their own tokens by specifying an `amount`. This reduces the total supply of the token and the balance of the caller.

## Prerequisites
- Solidity ^0.8.13
- Ethereum development environment (e.g., [Remix IDE](https://remix.ethereum.org), Hardhat, or Truffle)
- OpenZeppelin Contracts v4.0.0

## Usage
1. Deploy the `MyToken` contract with the desired token name and symbol.
2. The deployer will receive 100 tokens upon deployment.
3. Only the owner can mint additional tokens by calling the `mint` function.
4. Any token holder can burn their own tokens by calling the `burn` function.

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/CarlSntg/Metacrafters/blob/main/LICENSE) file for details.
