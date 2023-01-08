 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// This contract simulates a rolling dice game
contract SUBDICE {
    // The player address that will be throwing the dice
    address public player;

    // The random number that the player gets when they throw the dice
    uint public result;

    // This event is emitted whenever the player throws the dice and gets a new result
    event Result(uint result);

    constructor() {
        player = msg.sender;
    }

    // Function to generate a random number between 1 and 6 (inclusive)
    function random() private view returns (uint) {
        // Get the current block timestamp
        uint timestamp = block.timestamp;

        // Hash the timestamp and convert it to a uint
        return uint(keccak256(abi.encodePacked(timestamp)));
    }

    // Function to Roll the dice and get a new result
    function Roll() public {
        // Generate a random number between 1 and 6 (inclusive)
        result = random();
        result = result % 6 + 1;

        // Emit the Result event with the new result
        emit Result(result);
    }
   
}
