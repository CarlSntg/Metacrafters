# Functions & Errors - ETH + AVAX (Smart Contract)

This project is a simple smart contract written in Solidity. It provides basic functionalities for managing a balance with constraints on deposits and withdrawals. This contract is suitable for educational purposes, particularly in showcasing the revert(), require(), and assert() statements in error handling.

## Features

- **Balance Management:**
  - Initial Balance: 100
  - Maximum Withdrawal Limit: 200
- **Deposits**: Allows users to deposit funds into the contract, increasing their balance.
- **Withdrawals**: Allows users to withdraw funds from the contract, with constraints to prevent excessive withdrawals and ensure sufficient balance.

## Functions

1. **deposit(uint256 amount)**:
   - Adds the specified `amount` to the contract's balance.
   - Ensures that the deposit amount is greater than zero.

2. **withdraw(uint256 amount)**:
   - Deducts the specified `amount` from the contract's balance.
   - Uses the `validWithdrawal` modifier to ensure the amount does not exceed the maximum allowed limit (200).
   - Reverts the transaction if the withdrawal amount exceeds the available balance.

## Modifiers

- **validWithdrawal(uint256 amount)**:
  - Ensures that the `amount` being withdrawn does not exceed the `MAX_WITHDRAWAL` limit.
  - Uses `assert()` for validation.

## Prerequisites

To interact with this contract, you need:
- Solidity 0.8.26
- A development environment such as [Remix IDE](https://remix.ethereum.org)

## Usage

1. Deploy the contract using a Solidity compiler.
2. Use the **deposit** function to add funds to the contract.
3. Use the **withdraw** function to remove funds from the contract, ensuring that withdrawals do not exceed the balance or the maximum withdrawal limit.

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/CarlSntg/Metacrafters/blob/main/LICENSE) file for details.