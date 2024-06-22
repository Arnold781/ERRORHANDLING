# Voting System Smart Contract

## Overview

This smart contract enables a simple voting system where participants can vote for candidates. Each participant can vote only once, and the contract tracks the vote counts for each candidate.

## Key Features

- **Voting Mechanism**: Participants can cast their vote for a candidate by invoking the `vote` function.
- **Unique Voting**: Ensures each participant can vote only once through the `onlyOncePerPerson` modifier.
- **Vote Counting**: Automatically increments the vote count for the selected candidate.
- **Event Logging**: Logs the voter's address and the candidate index whenever a vote is cast.

## Usage

1. **Deploy the Contract**: Deploy the contract to a blockchain network of your choice.
2. **Add Candidates**: The contract initially contains two candidates. Modify the constructor to add more candidates as needed.
3. **Vote**: To vote, call the `vote` function with the index of the candidate you wish to vote for. Ensure you haven't voted before.

## Code Structure

- **Mappings and Arrays**: Tracks voters and stores candidate information.
- **Modifiers**: Enforces the one-vote-per-person rule.
- **Events**: Logs vote actions.

## Security Considerations

- Validate input parameters in the `vote` function to prevent out-of-bounds errors.
- Ensure the contract's constructor initializes candidates correctly.

## Deployment

Deployment instructions will vary depending on the blockchain network and tools used. Ensure you have the necessary permissions and setup to deploy smart contracts on your chosen network.
