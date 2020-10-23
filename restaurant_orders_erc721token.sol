pragma solidity >=0.4.22 <0.7.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
/*

*@Title Mapping of Restaurant orders 
@Author AMT

*/

contract orders is ERC721 {
    
    address owner;
    
    mapping(uint256 => orderdetails) orderlist;
    
    struct orderdetails{
    
        string dish_name; // Name of the dish_name
        uint256 dish_rate; //Rate of the dish_rate
        
        
    }
    
orderdetails order;
uint256 totalOrders;
    
     constructor() ERC721("OrderSumbit","ORD") public {
        owner = msg.sender;
    }
    modifier isOwner() {

         require(msg.sender == owner, "Access is not allowed");

         _;
         
    }
    
    
     function namedecl() public view  returns (string memory) {
         //calling the Built-in function in ERC721
        return name();
    }
    
    
    /**
     * @dev Function to display symbol of the token 
    */
     function symboldecl() public view  returns (string memory) {
         //calling the Built-in function in ERC721
        return symbol();
    }
    
     /**
     * @dev Function to display total count of the token 
    */
    
     function totalSupplycount() public view  returns (uint256) {
         //calling the Built-in function in ERC721
        return totalSupply();
     }

    
 function setOrders(uint256 _orderId,string memory _dishName, uint256 _dishRate) public isOwner {
     
     _mint(msg.sender,_orderId);
     
     order.dish_name = _dishName;
     order.dish_rate = _dishRate;
     orderlist[_orderId] = order;
     totalOrders = totalOrders +1;

 }   
 
 function getOrders(uint256 _orderId) public view returns(string memory, uint256){
     
     orderdetails memory order = orderlist[_orderId];
     return (order.dish_name,order.dish_rate);
     
 }
 
 function returnOrderCount()public view returns(uint256){
     
     return(totalOrders);
 
     
 }
 
  function transferOwnership(address from, address to, uint256 tokenId) public  {
        
        //Calling the Built-in function in ERC721
        _transfer(from, to, tokenId);
        
    }
    
 
 function deletemyRecord (uint256 _orderId) public isOwner {
         
        
        _burn( _orderId);
        
    }
 
 
 
    
}