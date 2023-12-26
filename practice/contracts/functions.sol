 
 
        // SPDX-License-Identifier: MIT
        pragma solidity 0.8.22;

        contract ErrorCheak {
          function checkNonZeroAddress(address addr)                      
           public
           pure 
           returns (string memory) {   
           //require which cheak 0 addresses            
           require(addr != address(0), "Address must not be zero");
           return "Address is not zero!";
          }
        }

