//SPDF-License-Identifier: MIT
pragma solidity ^0.8.24;

contract StudentContract {
    struct Student {
        uint id;
        string documentType;
        address addressStudent;
        string documentNumber;
        string name;
        string dateOfBirth;
        string email;
        string phone;
        string direction;
        uint[] coursesIds;
    }
    
    uint public studentCounter = 0;

    mapping(address => Student) public students;

    event StudentAdded(uint id, string name, string documentNumber);

    function addStudent(
        address _studentAddres,
        string memory _documentType,
        string memory _documentNumber,
        string memory _name,
        string memory _dateOfBirth,
        string memory _email,
        string memory _phone,
        string memory _direction
    ) public {
        require(students[_studentAddres].addressStudent != address(0), "Student already exists");
        studentCounter++;
        uint studentId = studentCounter;
        students[_studentAddres] = Student(
            studentId,
            _documentType,
            _studentAddres,
            _documentNumber,
            _name,
            _dateOfBirth,
            _email,
            _phone,
            _direction,
            new uint[](0)
        );
        emit StudentAdded(studentCounter, _name, _documentNumber);
    }

    function getStudentsCourses(
        address _studentAddress
    ) public view returns (uint[] memory) {
        require(
            students[_studentAddress].addressStudent != address(0),
            "Invalid student does not exist"
        );
        return students[_studentAddress].coursesIds;
    }

    function assignCourseToStudent(address _studentAddress, uint _courseId) public {
        require(
            students[_studentAddress].addressStudent != address(0),
            "Invalid student does not exist"
        );
        students[_studentAddress].coursesIds.push(_courseId);
    }
}
