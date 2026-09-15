ERC20 Staking Smart Contract

A Solidity-based ERC20 staking smart contract that allows users to stake ERC20 tokens and earn rewards based on the staking duration.

🚀 Features
Stake ERC20 tokens
Unstake tokens
Claim staking rewards
Time-based reward calculation
Owner-controlled reward configuration
Secure token transfers using OpenZeppelin
Solidity ^0.8.34
🛠️ Tech Stack
Solidity
OpenZeppelin Contracts
Ethereum / EVM
Remix IDE
ERC20
📂 Project Structure
ERC20-Staking/
│
├── contracts/
│   ├── Staking.sol
│   └── RewardToken.sol
│
└── README.md
⚙️ How It Works

Users deposit ERC20 tokens into the staking contract.

The contract records:

User's staked amount
Staking start time
Accumulated rewards

Rewards are calculated based on the amount staked and the time the tokens remain locked in the contract.

Basic Flow
User
  │
  │ Approve tokens
  ▼
Staking Contract
  │
  │ Stake
  ▼
Tokens Locked
  │
  │ Time passes
  ▼
Rewards Accumulate
  │
  ├── Unstake → Receive staked tokens
  │
  └── Claim Reward → Receive reward tokens
🔐 Main Functions
stake()

Allows a user to deposit ERC20 tokens into the staking contract.

stake(uint256 amount)
unstake()

Allows the user to withdraw their staked tokens.

unstake(uint256 amount)
claimReward()

Allows the user to claim accumulated staking rewards.

claimReward()
🧮 Reward Calculation

The reward can be calculated based on:

Reward = Staked Amount × APY × Staking Time / 365 Days

For example:

Staked Amount = 1,000 Tokens
APY = 10%
Duration = 1 Year

Reward = 100 Tokens
🔧 Installation & Usage
1. Clone the repository
git clone <your-repository-url>
2. Open the project in Remix

Import the Solidity contracts into Remix IDE.

3. Compile

Use a Solidity compiler compatible with:

^0.8.34
4. Deploy

Deploy the ERC20 token contract first, then deploy the staking contract with the required token addresses.

5. Approve Tokens

Before staking, approve the staking contract to spend your ERC20 tokens.

approve(stakingContract, amount)
6. Stake

Call:

stake(amount)
7. Claim Rewards

After staking for some time:

claimReward()
8. Unstake

Withdraw your tokens:

unstake(amount)
🛡️ Security

This project is created for learning and smart contract development practice.

It uses OpenZeppelin contracts for standard ERC20 functionality and safer token interactions.

This contract has not been professionally audited and should not be used with real funds without a proper security review.

📚 Learning Goals

This project is designed to practice:

ERC20 token interaction
approve() / transferFrom()
Solidity mappings
block.timestamp
Reward calculations
Token transfers
Access control
Smart contract state management
OpenZeppelin libraries
Staking mechanics
📌 Future Improvements
Multiple staking pools
Flexible APY
Lock periods
Early withdrawal penalties
Emergency withdrawal
Reward pool management
Compound rewards
Multiple reward tokens
Events and better tracking
Comprehensive test suite
👨‍💻 Author

Harshil Thummar

Solidity & Blockchain Developer
