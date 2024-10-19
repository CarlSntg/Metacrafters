// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract GymCheckInSystem {
    uint8 public gymCapacity = 5;
    uint8 public currentOccupancy = 0;
    mapping(address => bool) public activeMembership;
    mapping(address => bool) public isCheckedIn;

    // Function to activate membership
    function activateMembership() external {
        activeMembership[msg.sender] = true;
    }

    // Function to deactivate membership
    function deactivateMembership() external {
        activeMembership[msg.sender] = false;
    }

    // Function to check in to the gym
    function checkIn() external {
        require(activeMembership[msg.sender], "You must have an active membership to check in.");
        
        require(currentOccupancy < gymCapacity, "Gym is at full capacity, please wait for someone to check out.");
        
        require(!isCheckedIn[msg.sender], "You are already checked in.");
        
        currentOccupancy++;
        isCheckedIn[msg.sender] = true;
    }

    // Function to check out of the gym
    function checkOut() external {
        if (!isCheckedIn[msg.sender]) {
            revert("You are not checked in.");
        }
        
        currentOccupancy--;
        isCheckedIn[msg.sender] = false;

        assert(currentOccupancy >= 0);
    }
}
