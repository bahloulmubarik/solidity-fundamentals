              
               
               // SPDX-License-Identifier: MIT
               pragma solidity 0.8.22;

               import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
               import "@openzeppelin/contracts/access/Ownable.sol";

               contract Hope is ERC20, Ownable {
               constructor(address owner) ERC20("Hope", "HOP") Ownable(owner) {               
               _mint(msg.sender, 10000000 * 10 ** decimals());
                }

               function mint(address to, uint256 amount) public onlyOwner {                                      
              _mint(to, amount);
                }
               }

               