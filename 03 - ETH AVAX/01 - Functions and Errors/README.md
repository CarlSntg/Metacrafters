# Gym Check-In System (Functions & Errors - ETH + AVAX)

## Overview
This project is a simple smart contract written in Solidity that manages gym memberships and check-ins. It allows users to activate or deactivate their memberships, check in to the gym, and check out when they leave, ensuring that the gym's occupancy does not exceed its capacity. This contract is suitable for educational purposes, particularly in showcasing the revert(), require(), and assert() statements in error handling.

## Features
- Activate and deactivate gym memberships.
- Check in to the gym if you have an active membership and if there is available capacity.
- Check out from the gym, updating the occupancy status.

## Functions
### `activateMembership()`
Activates the gym membership for the caller.

### `deactivateMembership()`
Deactivates the gym membership for the caller.

### `checkIn()`
Allows the caller to check in to the gym if:
- They have an active membership (checked with `require`).
- The gym is not at full capacity (checked with `require`).
- They are not already checked in (checked with `require`).

The use of `require` ensures that the conditions are met before proceeding, providing clear error messages when they are not.

### `checkOut()`
Allows the caller to check out of the gym, which will:
- Ensure the caller is checked in (checked with `if` and `revert`).
- Update the current occupancy.

## Prerequisites
- Solidity 0.8.26
- Ethereum development environment (e.g., [Remix IDE](https://remix.ethereum.org))

## Usage
1. Deploy the `GymCheckInSystem` contract on the Ethereum network.
2. Users can call the `activateMembership` function to become members.
3. Members can check in using the `checkIn` function, provided the gym is not at full capacity and they are not already checked in.
4. When leaving, members should call the `checkOut` function to update the occupancy.

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/CarlSntg/Metacrafters/blob/main/LICENSE) file for details.
