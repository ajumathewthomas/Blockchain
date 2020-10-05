pragma solidity >=0.4.22 <0.7.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";

/* @Ttitle ERC 721 token with owner control
   @author AMT
   
 */

 

contract MyERC721Token is ERC721 {
   
    /**
     * @dev Create the Token by Passing the Name and Symbol to the ERC721 Cconstructor
     */
     
    address owner;
    constructor() ERC721("AMTCoin","AMT") public {
        
        owner =msg.sender; //Assigns the sender who is deploying this contract as the owner
        
    }
    
      modifier isOwner() {
        require(msg.sender == owner, "Access is not allowed"); //Modifier checks whether sender is the owner so that access will be allowed
        _;
    }
   
     function namedecl() public view  returns (string memory) {
        return name();
    }
   
     function symboldecl() public view  returns (string memory) {
        return symbol();
    }
     function totalSupplycount() public view  returns (uint256) {
        return totalSupply();
     }
    function mintMyToken(uint256 tokenId) public isOwner  {
       
        //Calling the Built-in function in ERC721
		
		/* Here modifier is added to the function so that only the owner can invoke this function */
		
        _mint(msg.sender,tokenId);
       
    }
   
    /**
     * @dev Function to Transfer a ERC721 token
     * @param from      Owner address
     * @param to        Receiver address
     * @param tokenId   ERC721 Token ID
     */
    function transferMyToken(address from, address to, uint256 tokenId) public  {
       
        //Calling the Built-in function in ERC721
        _transfer(from, to, tokenId);
       
    }
   
    /**
     * @dev Function to Burn a ERC721 token
     * @param tokenId ERC721 Token ID
     */
     function burnMyToken(uint256 tokenId) public isOwner  {
         
         //Calling the Built-in function in ERC721
		 
		 /* Here modifier is added to the function so that only the owner can invoke this function */
        _burn( tokenId);
       
    }
   
}

