//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ProfessorContract {
    struct Professor {
        uint id;
        string documentType;
        string documentNumber;
        string name;
        string lastName;
        string dateOfBirth;
        string email;
        string phone;
        string direction;
    }

    uint private professorCounter = 0;
    mapping (uint => Professor) public professors;

    event ProfessorAdded(uint id, string name, string documentNumber);

    function addProfessor(string memory _documentType, string memory _documentNumber, string memory _name, string memory _lastName, string memory _dateOfBirth, string memory _email, string memory _phone, string memory _direction) public {
        professorCounter++;
        uint professorId = professorCounter;
        professors[professorId] = Professor(professorId, _documentType, _documentNumber, _name, _lastName, _dateOfBirth, _email, _phone, _direction);
        emit ProfessorAdded(professorCounter, _name, _documentNumber);
    }

    function getProfessor(uint _professorId) public view returns (Professor memory) {
        require(_professorId > 0 && _professorId <= professorCounter, "Invalid professor id");
        return professors[_professorId];
    }
}