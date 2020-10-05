pragma solidity >=0.4.22 <0.7.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";

/* Title My ERC 721 token

@Author AMT

*/

contract MyERC721Token is ERC721{
    
    constructor() ERC721("AmtCoin","AMT") public {}
    
    /*@dev Funnction to mint a new ERC 721 token
    @param token ID Unique token ID
    
    */
    
    function mintMyToken (uint256 tokenId) public  {
       
        //Calling the Built-in function in ERC721
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
     function burnMyToken(uint256 tokenId) public  {
         
         //Calling the Built-in function in ERC721
        _burn( tokenId);
       
    }
   
}
    
    
    
    
    
    
    
