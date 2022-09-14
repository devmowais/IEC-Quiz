// SPDX-License-Identifier: GPL-3.0

pragma solidity ^ 0.8.16;

contract myQuiz1 {

    uint public a;
    uint public b;
    uint ans;

    function addVal(uint _a, uint _b) public {
        a = _a;
        b = _b;
        ans = _a + _b;
    }


    function answer() public view returns (uint) {
        return ans;
    }
}

contract myQuiz2 {
    
    mapping (address => uint256) public myAge;

    function age(uint256 _myAge) public {
        myAge[msg.sender] = _myAge;
    }

    function rAge() public view returns(uint256) {
        return myAge[msg.sender];
    }

}

contract myQuiz3 {
        address private owner;
        uint256 private rollNo = 1;

   struct Student{
       string name;
       uint256 age;
       uint256 marks;
       string gender;
       uint8 class;
   }

   Student[] students;

   constructor() {
       owner = msg.sender;
   }
   modifier onlyOwner() {
       require(msg.sender == owner, "You are not allowed to do that");
       _;
   }

   function addData(string memory _name, uint256 _age, uint256 _marks,string memory _gender, uint8 _class ) public onlyOwner {
       students.push(Student(_name,_age,_marks,_gender,_class));
       rollNo++;
   }


    function updateData(uint256 _rollNo,string memory _name, uint256 _age, uint256 _marks,string memory _gender, uint8 _class ) public onlyOwner {

       students[_rollNo - 1] = Student(_name,_age,_marks,_gender,_class);

    }

        function showData(uint256 _rollNo) public view returns(Student memory) {
            return students[_rollNo - 1];
    }

    function  allData() public view onlyOwner returns(Student[] memory) {
    return students;
}

    function highestMarks() public view returns (uint256) {
             uint256 result;    
        for(uint256 i = 0; i<students.length; i++) {
            if(students[i].marks > result ) {
            result = students[i].marks;
            }
        }
        return result;
    }

    
    function lowestMarks() public view returns (uint256) {
             uint256 result; 
        for(uint256 i = 0; i<students.length; i++) {
             if(i == 0) {
                 result = students[i].marks;
             }
          if(students[i].marks < result) {
            result = students[i].marks;
            }
        }
        return result;
    }

    function rollNumber() public view returns(uint256) {
        return rollNo - 1;
    }

}