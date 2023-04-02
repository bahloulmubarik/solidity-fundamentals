

//////////////////code/////////////////////////


////////////owner can do operation 5 times only/////////////////




//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;


contract ownerr{

    uint  num;
    address owner;
    error LimitReached();

    mapping(address => uint) public counter;

    modifier onlyowner(){
        require(msg.sender == owner, "you are not the owner");
        _;

    }


    function reset(uint _value) public onlyowner{
        counter[msg.sender] = _value;
    }

    function sum(uint a) public returns(uint){

        require(counter[msg.sender] < 5, "ur limit have max reached");
        uint value= 0;

        value = value + a;
        counter[msg.sender]++;

        return sumVal;

    }
}


///////////////////////////////////end///////////////////////////////////////////







////////////////////////////ATM OPERATION////////////////////////////////////

LIKE WE ARE DEPOSIT ONLY 2000 AND WITHDRAW 500 MIN LIKE AT ATM



//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ATM {
    // task of atm function
  uint256 private pin;
  uint256 private balance;
 error LoginDenied();
 

  constructor(uint256 _pin){
      pin = _pin ;
  

  }
  function login(uint256 _pin) public view{
    if (_pin != pin) {
        revert LoginDenied();
    }
  }
    // login successful, continue with transaction
    
   function Deposit(uint256 amount)public{
    if(amount<= 2000){
         balance += amount;
        revert LoginDenied();
    }   
       
   }
    function withdraw(uint256 amount)public {
        if(amount <= 500){
            balance -= amount;
            revert LoginDenied();
        }
    }
      function getBalance() public view returns(uint256){
         return balance;
      }
}



///////////////////////////////END/////////////////////////////////////





/////////////////////////array////////////////////////


contract Array{

    uint[] public dynamicArray;         // dynamic
    uint[] public myArray2 = [1,2,3];   
    uint[10] public myFixedArray;   //fixed


   function push(uint _value) public {
     dynamicArray.push(_value);
   }

  function pop() public {
    dynamicArray.pop();
  }

  function getLength() public view returns (uint) {
    return dynamicArray.length;
  }
  function remove(uint _index) public {
   delete dynamicArray[_index];
   pop();
  } 
}
/////////////// END ////////////////////
