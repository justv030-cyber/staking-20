// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";
// import "Staking.sol";

contract StakingPool {
    IERC20 public stakingToken;

    uint256 public totalSupply;

    uint256 public rewardPerTokenStored;
    uint256 public lastUpdateTime;
    uint256 public rewardRate;

    struct UserInfo {
        uint256 amount;
        uint256 reward;
        uint256 userRewardPerTokenPaid;
    }

    // mapping(address => uint256) public tokens;

    // mapping(address => uint256) public stakingTime;

    mapping(address => UserInfo) public users;

    modifier updateReward(address account) {
        rewardPerTokenStored = rewardPerToken();
        lastUpdateTime = block.timestamp;
        users[account].reward = earned(account);
        users[account].userRewardPerTokenPaid = rewardPerTokenStored;
        _;
    }

    constructor(address _tokenAddress) {
        stakingToken = IERC20(_tokenAddress);
    }

    function stake(uint256 _amount) public updateReward(msg.sender) {
        require(_amount > 0, "Please Enter Valid Amount");

        stakingToken.transferFrom(msg.sender, address(this), _amount);

        users[msg.sender].amount += _amount;

        totalSupply += _amount;
    }

    function unstake(uint256 _amount) public updateReward(msg.sender) {
        require(users[msg.sender].amount > 0, "Please Enter Valid Amount");
        require(
            users[msg.sender].amount >= _amount,
            "Please Enter Valid Amount"
        );

        users[msg.sender].amount -= _amount;

        stakingToken.transfer(msg.sender, _amount);

        totalSupply -= _amount;
    }

    function rewardPerToken() public view returns (uint256) {
        if (totalSupply == 0) {
            return rewardPerTokenStored;
        }
        return
            rewardPerTokenStored +
            ((block.timestamp - lastUpdateTime) * rewardRate * 1e18) /
                totalSupply;
    }

    function earned(address _acc) public view returns (uint256) {
        uint256 Reward = (users[_acc].amount *
            (rewardPerToken() - users[_acc].userRewardPerTokenPaid)) /
            1e18 +
            users[_acc].reward;
        return Reward;
    }

    function claimreward() public updateReward(msg.sender) {
        require(users[msg.sender].amount > 0, "No active stake");
        uint256 Reward = users[msg.sender].reward;

        users[msg.sender].amount = 0;

        stakingToken.transfer(msg.sender, Reward);
    }
}
