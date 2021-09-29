// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract cryptoBank {
    
    address owner;
    mapping (address => uint) accountHolders;
    uint count;

    constructor() payable {
        owner = msg.sender;
        require (msg.value >= 5*(1e18), "Transfer 50 ether to deploy contract");
        count = 0;
    }
    
    function bankBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    //step 2
    function closeBank() public {
        require (msg.sender == owner, "Only owner can close the bank");
        selfdestruct(payable(owner));
    }
        
    //step 3 & 4
    function newAccount() public payable {
        require(msg.value > 0, "Amount deposited should be greater than 0");
        require (msg.sender != owner, "Owner can not deposit more amount");
        accountHolders[msg.sender] = msg.value;
        
        //step 7
        if (count < 4) {
            accountHolders[msg.sender] += 1*1e18;
            count++;
        }
    }
    
    //step 5
    function depositAmount(uint amount) public payable {
        require(accountHolders[msg.sender] > 0, "Please create account with bank first");
        require(msg.value >= 1 ether && msg.value == amount*(1e18), "both amounts should be same and equal to 1 ether");
         accountHolders[msg.sender] += amount*(1e18);
    }
    
    //step 6
    function withdraw(uint _amount) public payable {
        require(_amount*1e18 <= accountHolders[msg.sender], "insufficient balance");
        payable(msg.sender).transfer(_amount*1e18);
        accountHolders[msg.sender] -= _amount*1e18;
    }
    
    //step 8
    function accountBalance() public view returns(uint) {
        return accountHolders[msg.sender];
    }
    
    //step 9
    function closeAccount() public payable {
        require(accountHolders[msg.sender] >0, "You dont have account with the bank");
        payable(msg.sender).transfer(accountHolders[msg.sender]);
    }
}
