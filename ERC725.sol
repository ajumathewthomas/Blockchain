// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.6.0;

// modules
import "./ERC725X.sol";
import "./ERC725Y.sol";

/**
 * @title ERC725 bundle
 * @dev Bundles ERC725X and ERC725Y together into one smart contract
 *
 *  @author Fabian Vogelsteller <fabian@lukso.network>
 */
 contract ERC725 is ERC725X, ERC725Y  {

     
    address founder;
    mapping(uint => identity) identity_id;
    
    struct identity {
        
        string hash;
        string filename;
        
        uint256 aadhar_id;
        string name;
        uint256 age;
        string dob;
        uint256 contact_no;
        string blood_group;
        
        string city;
        string state;
        string country;
        string hashLT;
        string hashLF1;
        string hashLF2;
        string hashLF3;
        string hashLF4;
        string hashLF5;
        string hashRF1;
        string hashRF2;
        string hashRF3;
        string hashRF4;
        string hashRF5;
        string hashLE;
        string hashRE;
        
        
    }identity id;
    
constructor() ERC725X(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4) ERC725Y(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4) 
      
   public {
       
        founder=msg.sender;
       
       
       
   }

    
   // #constructor() ERC725X(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4) public{
        
        
        
     //   }
        
         modifier isOwner() {

      
          require(msg.sender == founder, "Access is not allowed");

        _;
         
    }
    
    
function setDetails(uint256 _aadhar_id,string memory _name,uint256 _age,string memory _dob,uint256 _contact_no,string memory _blood_group, string memory _city,string memory _state,string memory _country) public isOwner{
    
   // _mint(msg.sender,_aadhar_id);
    
    id.name = _name;
    id.age = _age;
    id.dob =  _dob;
    id.contact_no = _contact_no;
    id.blood_group = _blood_group;
    id.city = _city;
    id.state = _state;
    id.country = _country;
    identity_id[_aadhar_id]=id;
    
    
  
}
   // 
  
    // NOTE this implementation has not by default: receive() external payable {}
    
    
    function getDetails(uint _aadhar_id)public view returns(string memory,uint256,string memory,uint256,string memory,string memory,string memory,string memory){
    
   
   identity memory _id = identity_id[_aadhar_id];
   return(_id.name,_id.age,_id.dob,_id.contact_no,_id.blood_group,_id.city,_id.state,_id.country);
   
    
}

}
