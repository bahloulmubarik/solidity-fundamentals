// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenSwap is Ownable {
    using SafeERC20 for IERC20;

    address public tokenA;
    address public tokenB;
    uint256 public exchangeRate;

    event Swapped(address indexed user, uint256 amountA, uint256 amountB);

    constructor(address _tokenA, address _tokenB, uint256 _exchangeRate) {
        tokenA = _tokenA;
        tokenB = _tokenB;
        exchangeRate = _exchangeRate;
    }

    function swapTokens(uint256 amountA) external {
        uint256 amountB = (amountA * exchangeRate) / 1e18;
        IERC20(tokenA).safeTransferFrom(msg.sender, address(this), amountA);
        IERC20(tokenB).safeTransfer(msg.sender, amountB);
        emit Swapped(msg.sender, amountA, amountB);
    }

    function setExchangeRate(uint256 newRate) external onlyOwner {
        require(newRate > 0, "Invalid exchange rate");
        exchangeRate = newRate;
    }
}
