   


             // SPDX-License-Identifier: MIT
             pragma solidity 0.8.22;

             contract FunctionSelector {
             function getSelector(string calldata _func) external pure returns (bytes4) {
             return bytes4(keccak256(bytes(_func)));
             }
            }

             contract Receiver {
             event Log(bytes data);

             function transfer() external {
             // 0x3b68bbe9
             emit Log(msg.data);
             }
            }
 