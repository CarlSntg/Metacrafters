// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Assessment {
    address public owner;
    mapping(address => bool) public members;

    event MemberRegistered(address member);
    
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    function registerMember(address _member) public onlyOwner {
        require(!members[_member], "This address is already a member");
        members[_member] = true;
        emit MemberRegistered(_member);
    }

    function isMember(address _member) public view returns (bool) {
        return members[_member];
    }
}
