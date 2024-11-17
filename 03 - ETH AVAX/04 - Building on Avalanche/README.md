# DegenToken

## Overview  
The *DegenToken* project is an ERC-20 token contract written in Solidity, designed for a gamified token experience. It implements essential ERC-20 token features such as minting, burning, and transferring tokens, while introducing additional functionality for redeeming tokens for virtual items in a store. Built with OpenZeppelin's ERC-20 standard, this contract ensures security and adheres to best practices.

---

## Features  
- **Mint new tokens**: Restricted to the contract owner.  
- **Burn tokens**: Accessible to any token holder.  
- **Redeem tokens for store items**: Exchange tokens for pre-defined virtual items.  
- **Retrieve redeemed items**: View a history of items redeemed by the caller.  
- **Transfer tokens**: Inherited from the ERC-20 standard.  

---

## Functions  

### `constructor()`  
Initializes the token with the name *Degen* and symbol *DGN*. It sets up a virtual store with three pre-defined items:  
1. Enchanted Sword (100 tokens)  
2. Dragon Shield (150 tokens)  
3. Healing Potion (50 tokens)  

### `mint(address to, uint256 amount)`  
Allows the contract owner to mint new tokens and send them to the specified address. Restricted by the `onlyOwner` modifier.  

### `decimals()`  
Overrides the default decimals for ERC-20 tokens and returns `0`, making *Degen Tokens* whole units only.  

### `showStoreItem(uint8 itemId)`  
Retrieves the name and price of a store item by its ID. Valid IDs are between 1 and 3.  

### `redeemTokens(uint8 itemId)`  
Allows users to exchange tokens for store items.  
- Checks if the caller has enough tokens.  
- Burns the required token amount.  
- Adds the redeemed item to the caller's redemption history.  

### `getRedeemedItems()`  
Returns an array of items previously redeemed by the caller.  

### `ItemRedeemed` (Event)  
Emits an event whenever a user successfully redeems an item, logging the user’s address, item name, and item price.  

---

## Prerequisites  
- **Solidity**: ^0.8.18  
- Ethereum development environment (e.g., [Remix IDE](https://remix.ethereum.org), Hardhat, or Truffle)
- **OpenZeppelin Contracts**: v4.0.0+  

---

## Usage  
1. Deploy the `DegenToken` contract.  
2. The contract owner can mint tokens by calling the `mint` function.  
3. Token holders can:  
   - Burn tokens using the `burn` function.  
   - Redeem tokens for store items using `redeemTokens`.  
   - View their redeemed items with `getRedeemedItems`.  

---

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/CarlSntg/Metacrafters/blob/main/LICENSE) file for details. 
