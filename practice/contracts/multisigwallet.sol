// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.22;

contract MultiSigWallet{

    event Deposit(address indexed sender, uint amount);
    event submit(uint indexed txId);
    event approve(address indexed owner, uint txId);
    event execute(uint indexed txId);
    
    struct Transation{
        address to; 
        uint value; //value of transaction
        bytes data; //data that will send to the address
        bool executed; //means once transacation is execute we will set to the true
    }

    address[] public owners;
    mapping(address => bool) public isOwner;
    uint public required;

    Transation[] public transactions;
    mapping(uint=>(mapping(address=>bool)) public approved; //means that transaction by owner or not
}

