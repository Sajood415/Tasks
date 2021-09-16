// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// Task 2
/* Make a smart contract to store student Data in it. name, address, phoneNumber, RollNumber, DOB, Year, Semester, GPA, University Name.
Add this data to struct from function.Make another function to read this data.
*/

contract Task_2 {
    
    mapping(uint8 => StudentData) public data;
    uint8 count = 0;
    
    struct StudentData {
        uint8 rollNo;
        string name;
        string houseAddress;
        uint phoneNumber;
        string dob;
        uint year;
        uint semester;
        uint gpa;
        string universityName;
    }
    
 function setData(uint8 _rollNo, string memory _name, string memory _houseAddress, uint _phoneNumber, string memory _dob, uint _year, uint _semester, uint _cgpa, string memory _universityName ) public  {
      data[count].rollNo = _rollNo;
      data[count].name = _name;
      data[count].houseAddress = _houseAddress;
      data[count].phoneNumber = _phoneNumber;
      data[count].dob = _dob;
      data[count].year = _year;
      data[count].semester = _semester;
      data[count].gpa = _cgpa;
      data[count].universityName = _universityName;     
      count++;
  }
}
