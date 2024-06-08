//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract RoomContract {
    struct Room {
        uint id;
        string name;
        string description;
        uint capacity;
    }

    uint private roomCounter = 0;
    mapping (uint => Room) public rooms;

    event RoomAdded(uint id, string name);

    function addRoom(string memory _name, string memory _description, uint _capacity) public {
        roomCounter++;
        uint roomId = roomCounter;
        rooms[roomId] = Room(roomId, _name, _description, _capacity);
        emit RoomAdded(roomCounter, _name);
    }

    function updateRoom(uint _roomId, string memory _name, string memory _description, uint _capacity) public {
        require(_roomId > 0 && _roomId <= roomCounter, "Invalid room id");
        Room storage room = rooms[_roomId];
        room.name = _name;
        rooms[_roomId].description = _description;
        rooms[_roomId].capacity = _capacity;
    }

    function getRoom(uint _roomId) public view returns (Room memory) {
        require(_roomId > 0 && _roomId <= roomCounter, "Invalid room id");
        Room memory room = rooms[_roomId];
        return room;
    }

    function getRoomDetail(uint _roomId) public view returns (uint, string memory, string memory, uint) {
        require(_roomId > 0 && _roomId <= roomCounter, "Invalid room id");
        Room memory room = rooms[_roomId];
        return (room.id, room.name, room.description, room.capacity);
    }
}