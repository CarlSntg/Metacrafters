// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract MyToken {

    // Public variables to store token details
    string public tokenName = "Carl";
    string public tokenAbbrv = "CRL";
    uint public totalSupply = 0;

    // Mapping to store the balance of each address
    mapping(address => uint) public balances;

    // Mint function to increase total supply and balance of an address
    function mint(address _address, uint _value) public {
        totalSupply += _value;
        balances[_address] += _value;
    }

    // Burn function to decrease total supply and balance of an address
    function burn(address _address, uint _value) public {
        // Ensure the address has enough tokens to burn
        if (balances[_address] >= _value) {
            totalSupply -= _value;
            balances[_address] -= _value;
        }
    }
}
