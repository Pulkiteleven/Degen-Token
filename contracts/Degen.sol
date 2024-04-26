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
