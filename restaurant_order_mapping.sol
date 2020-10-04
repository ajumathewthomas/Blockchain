pragma solidity >=0.4.22 <0.7.0;

/*

*@Title Mapping of Restaurant orders 
@Author AMT

*/

contract orders {
    
    mapping(string => orderdetails) orderlist;
    
    struct orderdetails{
    
        string dish_name; // Name of the dish_name
        uint256 dish_rate; //Rate of the dish_rate
        
        
    }
    
    orderdetails order;
    uint256 totalOrders;
    
 function setOrders(string memory _orderId,string memory _dishName, uint256 _dishRate) public {
     
     order.dish_name = _dishName;
     order.dish_rate = _dishRate;
     orderlist[_orderId] = order;
     totalOrders = totalOrders +1;

 }   
 
 function getOrders(string memory _orderId) public view returns(string memory, uint256){
     
     orderdetails memory order = orderlist[_orderId];
     return (order.dish_name,order.dish_rate);
     
 }
 
 function returnOrderCount()public view returns(uint256){
     
     return(totalOrders);
 
     
 }
 
 
 
    
}