



       // SPDX-License-Identifier: MIT
       pragma solidity 0.8.22;

        contract StateVariableIntro {
        //state variable initialized with my name
        string public myName = "Bahloul Mubarik";

        // Function to update the state variable
        function setName(string memory _newName) public {                     
        myName = _newName;
         }
        }




