// SPDX-License-Identifier:MIT
pragma solidity 0.8.26;

contract SmartContract {
    uint256 public balance;
    uint256 public constant MAX_WITHDRAWAL = 200;

    constructor() {
        balance = 100;
    }

    // Modifier using assert() ensure the withdrawal doesn't exceed max withdrawal
    modifier validWithdrawal(uint256 amount) {
        assert(amount <= MAX_WITHDRAWAL);
        _;
        
    }

    // Function using require() to check deposit condition
    function deposit(uint256 amount) public {
        require(amount > 0, "Deposit amount must be greater than zero.");
        balance += amount;
    }

    // Function using the validWithdrawal modifier and revert() to check withdrawal condition
    function withdraw(uint256 amount) public validWithdrawal(amount) {
        if (amount > balance) {
            revert("Insufficient balance to withdraw.");
        }
        balance -= amount;
    }
}
