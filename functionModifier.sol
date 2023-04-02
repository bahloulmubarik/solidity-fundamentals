//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;


contract Task{

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
