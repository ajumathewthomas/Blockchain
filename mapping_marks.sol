pragma solidity >=0.4.22 <0.7.0;

/*

*@Title Mapping of Marks
@Author AMT

*/

contract class {
    
    
    mapping(uint256 => student) studentlist;
    
    struct student{
        
        string name; // Name of the student
        uint256 mark1; // Mark of first subject
        uint256 mark2; // Mark of second subject
        uint256 mark3; //Mark of third subject
        uint256 mark4; //Mark of fourth subject
        uint256 mark5; //Mark of fifth subject
        uint256 total; //Total Subject Marks
        uint256 avg; //Average of 5 subject Marks
        }
        
        student stud;
        uint256 totalStudents;
        
        function setDetails(uint256 _rollno,string memory _name,uint256 _mark1,uint256 _mark2,uint256 _mark3,uint256 _mark4,uint256 _mark5) public {
            
            stud.name = _name;
            stud.mark1 = _mark1;
            stud.mark2 = _mark2;
            stud.mark3 = _mark3;
            stud.mark4 = _mark4;
            stud.mark5 = _mark5;
            stud.total = _mark1 + _mark2 + _mark3 + _mark4 + _mark5;
            stud.avg = stud.total/5;
            studentlist[_rollno] = stud;
            totalStudents = totalStudents +1;
            
            
        }
        
        
        function getDetails(uint256 _rollno) public  view returns(string memory,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256){
            
            student memory stud = studentlist[_rollno];
            return (stud.name,stud.mark1,stud.mark2,stud.mark3,stud.mark3,stud.mark4,stud.mark5,stud.total,stud.avg);
            
        }
        
        function returnStudents() public view returns(uint256){
            
            return (totalStudents);
            
        }
    
    
    
    
    
}