# BowlingGame Contract

## Overview

This Solidity contract implements a simple bowling game where players can roll a ball and record their scores. The contract uses `assert`, `revert`, and `require` for error handling to ensure the game operates correctly and securely.

## Features

- **Roll a Ball**: Players can roll a ball and record the number of pins knocked down.
- **Calculate Score**: The contract calculates the score based on the rolls.
- **Error Handling**: The contract uses `assert`, `revert`, and `require` for different error-handling scenarios.

## Getting Started

### Installation

No specific installation is required. This contract can be deployed to any Ethereum-compatible blockchain.

### Deployment

Deploy the contract using tools like Hardhat, Foundry, or Remix.

#### Steps to Deploy

1. **Compile the Contract**:
   Ensure you have the Solidity compiler installed and compile the contract.

   ```sh
   npx hardhat compile
   
### Deploy the Contract:
Use your preferred tool to deploy the contract. For example, with Hardhat:

```sh
npx hardhat run scripts/deploy.js --network <network-name>
```
Replace <network-name> with your target network (e.g., mainnet, sepolia).
