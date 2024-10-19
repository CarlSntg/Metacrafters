/*
Assessment Requirements
1. Create a variable that can hold a number of NFT's. What type of variable might this be?
2. Create an object inside your mintNFT function that will hold the metadata for your NFTs. 
   The metadata values will be passed to the function as parameters. When the NFT is ready, 
   you will store it in the variable you created in step 1
3. Your listNFTs() function will print all of your NFTs metadata to the console (i.e. console.log("Name: " + someNFT.name))
4. For good measure, getTotalSupply() should return the number of NFT's you have created
*/

// Create a variable to hold your NFTs
let nftCollection = [];

// This function will take in some values as parameters, create an
// NFT object using the parameters passed to it for its metadata, 
// and store it in the variable above.
function mintNFT(name, species, type, ability) {
    let nft = {
        name: name,
        species: species,
        type: type,
        ability: ability
    };
    nftCollection.push(nft);
    console.log("Minted NFT: " + name);
}

// This function will go through the array of NFTs and print
// their metadata with console.log()
function listNFTs() {
    for (let i = 0; i < nftCollection.length; i++) {
        console.log("NFT " + (i + 1));
        console.log("  Name: " + nftCollection[i].name);
        console.log("  Species: " + nftCollection[i].species);
        console.log("  Type: " + nftCollection[i].type);
        console.log("  Ability: " + nftCollection[i].ability);
    }
}

// This function will print the total number of NFTs we have minted
function getTotalSupply() {
    console.log("Total NFTs Minted: " + nftCollection.length);
}

// Call your functions below this line

// Minting NFTs
mintNFT("Bulbasaur", "Seed", "Grass", "Overgrow");
mintNFT("Lechonk", "Hog", "Normal", "Gluttony");
mintNFT("Squirtle", "Tiny Turtle", "Water", "Torrent");

// Listing all NFTs
listNFTs();

// Display total supply of NFTs
getTotalSupply();
