
            // SPDX-License-Identifier: MIT
            pragma solidity 0.8.22;

            contract ModifierIntro {
                address public owner;
                uint256 public totalAmount;

                constructor () {                                                                
                    owner = msg.sender;
                } 

                modifier onlyOwner {
                    require(msg.sender == owner, "you are not an owner ");
                    _;
                }
                function addAmount(uint256 _amount) public onlyOwner {                       
                    totalAmount = totalAmount + _amount; // += same 
                }
                function withdrawAmount(uint256 _amount) public onlyOwner{                        
                    require(_amount <= totalAmount , "no funds");
                    totalAmount = totalAmount - _amount; //-= same
                }
            }


            
            