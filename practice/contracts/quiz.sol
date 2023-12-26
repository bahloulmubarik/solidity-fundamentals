
       // SPDX-License-Identifier: MIT
       pragma solidity 0.8.22;

       contract functiondispater{
        uint public magic;

        function bar() external {
            magic = 1;
        }
        function foo() external {
            magic = 1;
        }
       }
       //In this challenge we are dealing with solc, functions dispatcher, and gas. The name of the function may affect its calling cost! But why does it actually happen?

        