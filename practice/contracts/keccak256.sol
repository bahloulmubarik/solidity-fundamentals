        
        
        // SPDX-License-Identifier: MIT
        pragma solidity 0.8.22;

        contract HashFunction {
        // Function to calculate the Keccak-256 hash of a given parameters
        function Hash(string memory text, uint num, address addr)                    
        public
        pure
        returns (bytes32) {
        return keccak256(abi.encodePacked(text, num, addr));
        }
       }