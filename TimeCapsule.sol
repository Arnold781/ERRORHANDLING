// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TimeCapsule {
    mapping(address => Message) public messages;
    
    struct Message {
        string content;
        uint256 timestamp;
    }
    
    event MessageAdded(address indexed depositor, string content, uint256 timestamp);
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }
    
    address private owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    function depositMessage(string memory _content) public {
        // Using revert to ensure the message is not empty
        if (bytes(_content).length == 0) {
            revert("Message cannot be empty");
        }

        require(msg.sender!= owner, "Owner cannot deposit messages");
        
        messages[msg.sender] = Message(_content, block.timestamp);
        emit MessageAdded(msg.sender, _content, block.timestamp);
    }
    
    function retrieveOneMessageByAddress(address _address) public view returns (string memory) {
        assert(msg.sender == owner);
        
        // Directly access the message from the mapping using the address
        Message storage message = messages[_address];
        
        assert(message.timestamp!= 0 && block.timestamp - message.timestamp >= 60 days);
        
        return message.content;
    }
}
