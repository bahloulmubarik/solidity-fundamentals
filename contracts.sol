

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

////////////multisigwallet////////////////

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MultiSigWallet {
    event Deposit(address indexed sender, uint amount, uint balance);
    event SubmitTransaction(
        address indexed owner,
        uint indexed txIndex,
        address indexed to,
        uint value,
        bytes data
    );
    event ConfirmTransaction(address indexed owner, uint indexed txIndex);
    event RevokeConfirmation(address indexed owner, uint indexed txIndex);
    event ExecuteTransaction(address indexed owner, uint indexed txIndex);

    address[] public owners;
    mapping(address => bool) public isOwner;
    uint public numConfirmationsRequired;

    struct Transaction {
        address to;
        uint value;
        bytes data;
        bool executed;
        uint numConfirmations;
    }

    // mapping from tx index => owner => bool
    mapping(uint => mapping(address => bool)) public isConfirmed;

    Transaction[] public transactions;

    modifier onlyOwner() {
        require(isOwner[msg.sender], "not owner");
        _;
    }

    modifier txExists(uint _txIndex) {
        require(_txIndex < transactions.length, "tx does not exist");
        _;
    }

    modifier notExecuted(uint _txIndex) {
        require(!transactions[_txIndex].executed, "tx already executed");
        _;
    }

    modifier notConfirmed(uint _txIndex) {
        require(!isConfirmed[_txIndex][msg.sender], "tx already confirmed");
        _;
    }

    constructor(address[] memory _owners, uint _numConfirmationsRequired) {
        require(_owners.length > 0, "owners required");
        require(
            _numConfirmationsRequired > 0 &&
                _numConfirmationsRequired <= _owners.length,
            "invalid number of required confirmations"
        );

        for (uint i = 0; i < _owners.length; i++) {
            address owner = _owners[i];

            require(owner != address(0), "invalid owner");
            require(!isOwner[owner], "owner not unique");

            isOwner[owner] = true;
            owners.push(owner);
        }

        numConfirmationsRequired = _numConfirmationsRequired;
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value, address(this).balance);
    }

    function submitTransaction(
        address _to,
        uint _value,
        bytes memory _data
    ) public onlyOwner {
        uint txIndex = transactions.length;

        transactions.push(
            Transaction({
                to: _to,
                value: _value,
                data: _data,
                executed: false,
                numConfirmations: 0
            })
        );

        emit SubmitTransaction(msg.sender, txIndex, _to, _value, _data);
    }

    function confirmTransaction(
        uint _txIndex
    ) public onlyOwner txExists(_txIndex) notExecuted(_txIndex) notConfirmed(_txIndex) {
        Transaction storage transaction = transactions[_txIndex];
        transaction.numConfirmations += 1;
        isConfirmed[_txIndex][msg.sender] = true;

        emit ConfirmTransaction(msg.sender, _txIndex);
    }

    function executeTransaction(
        uint _txIndex
    ) public onlyOwner txExists(_txIndex) notExecuted(_txIndex) {
        Transaction storage transaction = transactions[_txIndex];

        require(
            transaction.numConfirmations >= numConfirmationsRequired,
            "cannot execute tx"
        );

        transaction.executed = true;

        (bool success, ) = transaction.to.call{value: transaction.value}(
            transaction.data
        );
        require(success, "tx failed");

        emit ExecuteTransaction(msg.sender, _txIndex);
    }

    function revokeConfirmation(
        uint _txIndex
    ) public onlyOwner txExists(_txIndex) notExecuted(_txIndex) {
        Transaction storage transaction = transactions[_txIndex];

        require(isConfirmed[_txIndex][msg.sender], "tx not confirmed");

        transaction.numConfirmations -= 1;
        isConfirmed[_txIndex][msg.sender] = false;

        emit RevokeConfirmation(msg.sender, _txIndex);
    }

    function getOwners() public view returns (address[] memory) {
        return owners;
    }

    function getTransactionCount() public view returns (uint) {
        return transactions.length;
    }

    function getTransaction(
        uint _txIndex
    )
        public
        view
        returns (
            address to,
            uint value,
            bytes memory data,
            bool executed,
            uint numConfirmations
        )
    {
        Transaction storage transaction = transactions[_txIndex];

        return (
            transaction.to,
            transaction.value,
            transaction.data,
            transaction.executed,
            transaction.numConfirmations
        );
    }
}
