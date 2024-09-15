// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract MyToken {

    // Public variables
    string public tokenName = "Carl";
    string public tokenAbbrv = "CRL";
    uint public totalSupply = 0;

    // Mapping
    mapping(address => uint) public balances;

    // Minting
    function mint(address _address, uint _value) public {
        totalSupply += _value;
        balances[_address] += _value;
    }

    // Burning
    function burn(address _address, uint _value) public {
        // Ensure the address has enough tokens to burn
        if (balances[_address] >= _value) {
            totalSupply -= _value;
            balances[_address] -= _value;
        }
    }
}
