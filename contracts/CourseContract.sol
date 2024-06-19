//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


import "./StudentContract.sol";
import "./ProfessorContract.sol";
import "./RoomContract.sol";

contract CourseContract is StudentContract, ProfessorContract, RoomContract {
    struct Course {
        uint id;
        string name;
        string description;
        string schedule;
        uint professorId;
        uint roomId;
        uint[] studentsIds;
    }

    uint private courseCounter = 0;
    mapping (uint => Course) private courses;

    event CourseAdded(uint id, string name);
    event ScheduleAssigned(uint courseId, uint professorId, uint roomId);

    function addCourse(string memory _name, string memory _description, string memory _schedule, uint _professorId, uint _roomId) public {
        require(professors[_professorId].id != 0, "Invalid professor id");
        require(rooms[_roomId].id != 0, "Invalid room id");

        courseCounter++;
        uint courseId = courseCounter;
        courses[courseId] = Course(courseId, _name, _description, _schedule, _professorId, _roomId, new uint[](0));
        emit CourseAdded(courseCounter, _name);
    }

    function assignSchedule(address _studentAddress, uint _courseId) public {
        require(students[_studentAddress].addressStudent != address(0), "Invalid student does not exist");
        require(courses[_courseId].id != 0, "Invalid course id");

        assignCourseToStudent(_studentAddress, _courseId);
    }

    function getCourseDetails(uint _courseId) public view returns (string memory, string memory, string memory, string memory, string memory) {
        require(_courseId > 0 && _courseId <= courseCounter, "Invalid course id");
        Course memory course = courses[_courseId];
        string memory professorName = getProfessor(course.professorId).name;
        string memory roomName = getRoom(course.roomId).name;
        return (course.name, course.description, course.schedule, professorName, roomName);
    }

    function getStudentSchedule(address _studentAddress) public view returns (string memory) {
         require(students[_studentAddress].addressStudent != address(0), "Invalid student does not exist");
        uint[] memory coursesIds = students[_studentAddress].coursesIds;
        string memory schedule = "";
        for (uint i = 0; i < coursesIds.length; i++) {
            Course memory course = courses[coursesIds[i]];
            string memory professorName = getProfessor(course.professorId).name;
            string memory roomName = getRoom(course.roomId).name;
            schedule = string(abi.encodePacked(schedule, course.name, " - ", professorName, " - ", roomName, "\n"));
        }
        return schedule;
    }
}