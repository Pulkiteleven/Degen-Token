# Hello World

This Solidity program is a "DEGEN TOKEN" program that demonstrates the basic syntax and functionality of the Solidity programming language. The purpose of this program is to serve as a starting point for those who are new to Solidity and want to get a feel for how it works.

## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract of "DegenToken" is in file named "degenToken.sol"


## Getting Started

### Executing program

Open VS code and run this Commmand

```javascript
npm init-y
```

this will initiate your NPM packages

```javascript
npm install --save-dev hardhat
```

then

```javascript
npx hardhat
```

after than paste the following code in degentoken.sol

```javascript

// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract DegenToken is ERC20{
    struct reddemItem{
        uint value;
        string name;
    }
    reddemItem[] public allReddemItems;
    address owner;
    mapping (address => reddemItem[]) public userReddem;
    constructor() ERC20("Degen", "DGN") {
         owner = msg.sender;      
         allReddemItems.push(reddemItem(200,"Grogu NFT"));   
         allReddemItems.push(reddemItem(300,"Falcon NFT"));   
         allReddemItems.push(reddemItem(100,"Jedi NFT"));   
    }


    function Minter(address toAddress, uint supply) public {
        require(msg.sender == owner,"Only Owner can min the tokesn");
        _mint(toAddress, supply);
    }

    function Burner(uint supply) public {
        if(balanceOf(msg.sender) < supply){
            revert("You Don't have enough Tokens");
        }

        _burn(msg.sender, supply);
    }

    function getReddemItem() public  view returns (reddemItem[] memory){
        return allReddemItems;
    }

    function getUserReddem() public  view returns (reddemItem[] memory){
        return userReddem[msg.sender];
    }

    function ReddemNow(uint index) public  {
        require(index > 0 && index < 3, "Please Enter index in range 0 to 2");
        require(balanceOf(msg.sender) >= allReddemItems[index].value, "You don't have enough Tokens");

        userReddem[msg.sender].push(allReddemItems[index]);
        Burner(allReddemItems[index].value);
    }

    // function Reddem()



}

```

To Run the program just clone this repository and update your private key in 'hardhat.config.js' file
to deploy the contract run the following command
```javascript
npx hardhat run scripts/deploy.js --network fuji
```

this will give you the address of your contract

now you can tract this address on SnowTrace or test the contract on Remix.

## Authors

Pulkit Dubey 

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
