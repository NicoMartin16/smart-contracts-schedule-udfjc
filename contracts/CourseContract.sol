//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

enum DayOfWeek {
    MONDAY,
    TUESDAY,
    WEDNESDAY,
    THURSDAY,
    FRIDAY,
    SATURDAY,
    SUNDAY
}

contract CourseContract {

    address public student;

    struct Course {
        uint id;
        string name;
        string description;
        uint professorId;
        address[] students;
        mapping(uint => TimeSlot) schedule;
        uint scheduleSize;
    }

    struct TimeSlot {
        DayOfWeek dayOfWeek;
        uint startTime;
        uint endTime;
        string location;
    }

    struct Professor {
        uint id;
        string name;
        string email;
    }

    uint public nextCourseId = 0;
    uint public nextProfessorId = 0;

    mapping(uint => Course) public courses;
    mapping(uint => Professor) public professors;
    uint[] public coursesIds;

    event CourseCreated(uint courseId, string name, string description);

    function createCourse(uint _id, string memory _name, string memory _description) public {
        Course storage course = courses[nextCourseId];
        course.id = _id;
        course.name = _name;
        course.description = _description;
        course.professorId = 0;
        course.scheduleSize = 0;
        course.students = new address[](0);
        nextCourseId++;
        coursesIds.push(nextCourseId);
        emit CourseCreated(nextCourseId, _name, _description);
    }
}