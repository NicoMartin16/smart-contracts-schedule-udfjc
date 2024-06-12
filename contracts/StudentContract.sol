//SPDF-License-Identifier: MIT
pragma solidity ^0.8.24;

contract StudentContract {
    struct Student {
        uint id;
        string documentType;
        string documentNumber;
        string name;
        string dateOfBirth;
        string email;
        string phone;
        string direction;
        uint[] coursesIds;
    }

    uint public studentCounter = 0;

    mapping(uint => Student) public students;

    event StudentAdded(uint id, string name, string documentNumber);

    function addStudent(string memory _documentType,string memory _documentNumber,string memory _name,string memory _dateOfBirth,string memory _email,string memory _phone,string memory _direction) public {
        studentCounter++;
        uint studentId = studentCounter;
        students[studentId] = Student(studentId,_documentType,_documentNumber,_name,_dateOfBirth,_email,_phone,_direction,new uint[](0));
        emit StudentAdded(studentCounter, _name, _documentNumber);
    }

    function getStudentsCourses(uint _studentId) public view returns (uint[] memory) {
        require(_studentId > 0 && _studentId <= studentCounter, "Invalid student id");
        return students[_studentId].coursesIds;
    }

    function assignCourseToStudent(uint _studentId, uint _courseId) public {
        require(_studentId > 0 && _studentId <= studentCounter, "Invalid student id");
        students[_studentId].coursesIds.push(_courseId);
    }
}
