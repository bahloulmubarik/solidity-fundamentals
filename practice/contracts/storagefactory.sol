    
    // SPDX-License-Identifier: MIT

    pragma solidity ^0.8.22;

    import "./simplestorage.sol";

    contract StorageFactory{
  
    SimpleStorage[] public listOfSimpleStorageContracts;

    //This function is creating new SimpleStorageContract
    function createSimpleStorageContract() public {                                                                   
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);

     }
    //This function is responsible for storing new value to SimpleStoregeContracts
    function sfStore(uint _simpleStorageIndex, uint _newsimpleStorageNumber) public {                        
        //address
        //ABI- Application Binary Interface
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[ _simpleStorageIndex];
        mySimpleStorage.store(_newsimpleStorageNumber);
     }
    //This function is retrieving new Values that we store on Index
    function sfGet(uint _simpleStorageIndex) public view returns(uint){                               
        return listOfSimpleStorageContracts[ _simpleStorageIndex].retrieve();
     }
    }


    

