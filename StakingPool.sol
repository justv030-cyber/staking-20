// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract StakingPool {
    IERC20 public stakingToken;

    mapping(address => uint256) public tokens;

    mapping(address => uint256) public stakingTime;

    constructor(address _tokenAddress) {
        stakingToken = IERC20(_tokenAddress);
    }

    function stake(uint256 _amount) public {
        require(_amount > 0, "Please Enter Valid Amount");

        stakingToken.transferFrom(msg.sender, address(this), _amount);

        stakingTime[msg.sender] = block.timestamp;

        tokens[msg.sender] += _amount;
    }

    function unstake(uint256 _amount) public {
        require(_amount > 0, "Please Enter Valid Amount");
        require(tokens[msg.sender] >= _amount, "Insufficient Balance");

        tokens[msg.sender] -= _amount;

        stakingToken.transfer(msg.sender, _amount);
    }
}
