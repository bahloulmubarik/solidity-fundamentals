 

  
        // SPDX-License-Identifier: MIT
        pragma solidity 0.8.22;

        contract A {
            function foo() public pure virtual returns(string memory){           
                return "A";
            }
            function bar() public pure virtual returns(string memory){            
                return "A";
            }
            function baz() public pure virtual returns(string memory){             
                return "A";
            }

        }

        contract B is A {
            function foo() public pure override returns(string memory){                 
                return "B";
            }
            function bar() public pure  override returns (string memory){                
                return "B";
            }
          }

        contract C is A {
             function bar() public pure  override returns (string memory){                
                return "B";
            }
        }
        