// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract BraCoin{

    mapping (address=>uint) balances;
    string ticker="BraCoin";
    uint limit=10000;
    uint currentCant=0;
    bool burnable=false;
    address  minter;
    
    constructor(){
        minter=msg.sender;
        balances[msg.sender]=50;
    }

    function mint ( address user,uint cant)public {
        require(msg.sender==minter,"You are not minter");
        balances[user]+=cant;
        currentCant+=cant;
        require(currentCant<=limit,"The limit has been reached");
    }

    function send (address _address,uint _amount) public {
        require(balances[msg.sender]>=_amount);
        balances[msg.sender]-=_amount;
        balances[_address]+=_amount;
    }
    function getBalance(address _address) external view returns(uint ) {
        uint  result = balances[_address];
        return result;
    }


}