// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// Task 1
// Make a smart contract to receive ether in it. Send these ether from smart contract to another address.

contract Task_1 {
    receive() external payable {}
    
    function getContractBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    function sendEther(address payable _to) external  {
        _to.transfer(address(this).balance);
    }
}
    
  
