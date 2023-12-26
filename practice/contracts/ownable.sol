           
           
           // SPDX-License-Identifier: MIT
            pragma solidity 0.8.22;

            contract Ownables{
                address public owner;

                constructor(){                                                  
                   owner= msg.sender;
                }
            modifier onlyOwner{
                require(msg.sender == owner , "not owner");
            _;
            }
            function setOnwer(address _newOwner) external onlyOwner{                   
                require(_newOwner != address(0), "invalid address");
                owner = _newOwner;
            }
            function onlyownercancall() external onlyOwner{                             
                //code 
            }
            function everyonecancall() external {                                          
                //code
            }
            }
