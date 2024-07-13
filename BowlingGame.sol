// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BowlingGame {
    address public owner;
    uint256 public currentFrame;
    mapping(uint256 => uint256[2]) public frames;
    mapping(uint256 => uint256) public frameScores;
    bool public gameOver;

    event Roll(uint256 frame, uint256 rollIndex, uint256 pins);
    event FrameScore(uint256 frame, uint256 score);

    constructor() {
        owner = msg.sender;
        currentFrame = 1;
        gameOver = false;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    modifier gameNotOver() {
        require(!gameOver, "The game is over");
        _;
    }

    function roll(uint256 pins) external onlyOwner gameNotOver {
        if(pins > 10) {
            revert("Invalid number of pins");
        }

        uint256 rollIndex = frames[currentFrame][0] == 0 ? 0 : 1;
        frames[currentFrame][rollIndex] = pins;

        emit Roll(currentFrame, rollIndex, pins);

        if (rollIndex == 1 || pins == 10) {
            calculateFrameScore(currentFrame);
            currentFrame++;
            if (currentFrame > 10) {
                gameOver = true;
            }
        }
    }

    function calculateFrameScore(uint256 frame) internal {
        uint256 score = frames[frame][0] + frames[frame][1];
        frameScores[frame] = score;
        emit FrameScore(frame, score);
    }

    function getFrameScore(uint256 frame) external view returns (uint256) {
        assert(frame <= currentFrame);
        return frameScores[frame];
    }

    function getTotalScore() external view returns (uint256) {
        uint256 totalScore = 0;
        for (uint256 i = 1; i <= currentFrame; i++) {
            totalScore += frameScores[i];
        }
        return totalScore;
    }

    function resetGame() external onlyOwner {
        for (uint256 i = 1; i <= 10; i++) {
            frames[i][0] = 0;
            frames[i][1] = 0;
            frameScores[i] = 0;
        }
        currentFrame = 1;
        gameOver = false;
    }
}
