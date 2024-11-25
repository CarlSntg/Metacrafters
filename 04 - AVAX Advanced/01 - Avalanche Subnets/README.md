# Deploying an Avalanche Subnet with ERC20 and Vault Smart Contracts

## Overview

This project demonstrates how to deploy an Avalanche subnet and deploy two Solidity smart contracts—an ERC20 token and a Vault contract—on the subnet. These contracts enable the creation and management of a custom ERC20 token and a staking mechanism where users can deposit and withdraw tokens.

## Features

- **ERC20 Token**: Implements a basic ERC20 token with minting, burning, transferring, and allowance functionalities.
- **Vault Contract**: Provides a staking mechanism where users can deposit ERC20 tokens to earn shares and withdraw their stakes.

## Prerequisites

- [Avalanche-CLI](https://docs.avax.network/tooling/guides/get-avalanche-cli) installed
- Hardhat development environment set up
- MetaMask or other Avalanche-compatible wallets

---

## Smart Contracts

### 1. **ERC20.sol**

#### Features:
- Mint tokens to any address.
- Burn tokens from the sender’s balance.
- Transfer tokens between accounts.
- Approve and manage token allowances.

#### Key Functions:
- `mint(uint amount)`: Mints the specified amount of tokens to the sender.
- `burn(uint amount)`: Burns the specified amount of tokens from the sender.
- `transfer(address recipient, uint amount)`: Transfers tokens to another account.
- `approve(address spender, uint amount)`: Sets an allowance for a spender.
- `transferFrom(address sender, address recipient, uint amount)`: Transfers tokens using an allowance.

---

### 2. **Vault.sol**

#### Features:
- Deposit ERC20 tokens and receive shares proportional to the amount deposited.
- Withdraw deposited tokens based on shares held.

#### Key Functions:
- `deposit(uint amount)`: Deposits ERC20 tokens and mints staking shares.
- `withdraw(uint shares)`: Burns shares and returns the proportional amount of deposited tokens.

---

## **Set Up Avalanche Subnet**

1. **Install Avalanche-CLI**:
   ```bash
   curl -sSfL https://raw.githubusercontent.com/ava-labs/avalanche-cli/main/scripts/install.sh | sh -s
   ```

2. **Create a Subnet**:
   ```bash
   avalanche subnet create MySubnet
   ```

3. **Deploy the Subnet**:
   ```bash
   avalanche subnet deploy MySubnet
   ```

4. **Add the Subnet to MetaMask**:
   Follow the instructions provided after the subnet deployment to add the custom subnet to your MetaMask wallet.

---

## Usage

- **MetaMask Integration**: Add your deployed token and interact with the contracts using MetaMask.
- **Hardhat Console**: Use the Hardhat console for testing and calling smart contract functions:
  ```bash
  npx hardhat console --network avalancheSubnet
  ```

---

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/CarlSntg/Metacrafters/blob/main/LICENSE) file for details.