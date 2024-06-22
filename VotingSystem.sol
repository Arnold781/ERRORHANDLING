// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    // Mapping to keep track of who has voted
    mapping(address => bool) public hasVoted;
    
    // Struct to represent a candidate
    struct Candidate {
        uint voteCount;
    }
    
    // Array to hold candidates
    Candidate[] public candidates;
    
    // Event to emit when a vote is cast
    event VoteCast(address voter, uint candidateIndex);
    
    // Modifier to restrict casting votes to once per person
    modifier onlyOncePerPerson() {
        require(!hasVoted[msg.sender], "You have already voted.");
        _;
        hasVoted[msg.sender] = true;
    }
    
    // Constructor to initialize the contract
    constructor() {
        // Example candidates
        candidates.push(Candidate(0));
        candidates.push(Candidate(0));
    }
    
    // Function to cast a vote
    function vote(uint _candidateIndex) public onlyOncePerPerson {
        // Using revert to ensure the candidate index is valid
        if(_candidateIndex > candidates.length)
        revert("Candidate index out of bounds");       
        
        
        // Check if the voter has already voted
        assert(hasVoted[msg.sender] == false);
        
        // Increment the vote count for the selected candidate
        candidates[_candidateIndex].voteCount += 1;

        hasVoted[msg.sender] == true;
        
        // Emit the vote cast event with the candidate index
        emit VoteCast(msg.sender, _candidateIndex);
    }
}
