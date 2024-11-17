// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    struct Item {
        string name;
        uint256 price;
    }

    mapping(uint8 => Item) public storeItems;
    mapping(address => Item[]) private redeemedItems;

    constructor() ERC20("Degen", "DGN") {
        storeItems[1] = Item("Enchanted Sword", 100);
        storeItems[2] = Item("Dragon Shield", 150);
        storeItems[3] = Item("Healing Potion", 50);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function decimals() public pure override returns (uint8) {
        return 0;
    }

    function showStoreItem(uint8 itemId) public view returns (string memory, uint256) {
        require(itemId > 0 && itemId <= 3, "Invalid item ID");
        Item memory item = storeItems[itemId];
        return (item.name, item.price);
    }

    function redeemTokens(uint8 itemId) external {
        require(itemId > 0 && itemId <= 3, "Invalid item ID");
        Item memory item = storeItems[itemId];
        require(balanceOf(msg.sender) >= item.price, "You do not have enough Degen Tokens to buy this item.");
        
        _burn(msg.sender, item.price);
        
        redeemedItems[msg.sender].push(item);

        emit ItemRedeemed(msg.sender, item.name, item.price);
    }

    function getRedeemedItems() external view returns (Item[] memory) {
        return redeemedItems[msg.sender];
    }

    event ItemRedeemed(address indexed player, string itemName, uint256 amount);
}
