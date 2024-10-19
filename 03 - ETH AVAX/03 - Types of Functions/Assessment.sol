// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {

    address public owner;

    // Constructor that sets the token name and symbol, and assigns the deployer as the owner
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        owner = msg.sender;
        _mint(msg.sender, 100 * 10 ** decimals());
    }

    // Modifier to restrict minting to only the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can mint tokens");
        _;
    }

    // Function to allow the contract owner to mint new tokens
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    // Function to allow any user to burn their own tokens
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}
