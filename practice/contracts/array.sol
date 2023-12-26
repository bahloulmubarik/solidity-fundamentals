             
               
               
               // SPDX-License-Identifier: MIT
               pragma solidity 0.8.22;

               contract IntroTomapping {

               uint256 myFavoriteNumber;
   
                struct Person{
                uint256 favoriteNumber;
                string name; 
               }

               //dynamic array
               Person[] public ListOfPeople;
               
               //mapping
               mapping (string => uint256) public nameToFavoriteNumber;

               function addPerson(uint256 _favoriteNumber, string memory _name) public {                               
               ListOfPeople.push(Person(_favoriteNumber , _name));
               nameToFavoriteNumber[_name] = _favoriteNumber;
               }
               }

            

              

