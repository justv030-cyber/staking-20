// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract StakingPool {
    IERC20 public stakingToken;

    struct UserInfo {
        uint256 amount;
        uint256 rewardDebt;
        uint256 lastUpdate;
    }

    // mapping(address => uint256) public tokens;

    // mapping(address => uint256) public stakingTime;

    mapping(address => UserInfo) public users;

    constructor(address _tokenAddress) {
        stakingToken = IERC20(_tokenAddress);
    }

    function stake(uint256 _amount) public {
        require(_amount > 0, "Please Enter Valid Amount");

        stakingToken.transferFrom(msg.sender, address(this), _amount);

        users[msg.sender].amount += _amount;
    }

    function unstake(uint256 _amount) public {
        require(users[msg.sender].amount > 0, "Please Enter Valid Amount");
        require(
            users[msg.sender].amount >= _amount,
            "Please Enter Valid Amount"
        );

        users[msg.sender].amount -= _amount;

        stakingToken.transfer(msg.sender, _amount);
    }
}
