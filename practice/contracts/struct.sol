        
        
        // SPDX-License-Identifier: MIT
        pragma solidity 0.8.22;

        contract CarRegistry {

        // Define a struct named Car
        struct Car {
        address owner;
        string  model;
        uint256 year;
        }

        // Declare an array of 'Car' structs
        Car[] public cars;

        // Function to add a new car
        function addCar(address _owner,                                                        
                       string memory _model, 
                       uint256 _year) public {

        cars.push(Car(_owner, _model, _year));
         }
        }



        
