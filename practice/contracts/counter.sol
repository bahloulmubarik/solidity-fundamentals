      
      
      
       // SPDX-License-Identifier: MIT
       pragma solidity 0.8.22;

       contract CounterIntro {
        //state variable type uint named count
        uint public count;

       function increment() external {                    
            count += 1 ;
        } 
       function decrement() external {                    
            count -= 1;
        }
       }