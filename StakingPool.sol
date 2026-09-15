// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract StakingPool {
    IERC20 public stakingToken;

    constructor(address _tokenAddress) {
        stakingToken = IERC20(_tokenAddress);
    }
}
