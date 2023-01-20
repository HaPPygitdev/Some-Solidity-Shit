// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Demo{
    // require (принимает 2 аргумента, первое - условное выражение)
    // revert (принимает только сообщение об ошибке). Выполняется всегда
    // assert (принимает условное выражение) Если ложь - выдает ошибку "Panic"
    address owner;
    
    event Paid(address indexed _from, uint _amount, uint _timestamp);

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        pay();
    }

    function pay() public payable{
        emit Paid(msg.sender, msg.value, block.timestamp);
    }

    modifier onlyOwner(address _to){
        require(msg.sender == owner, "you are not an owner!");
        require(_to != address(0), "incorrect"); // address(0) - базовое значение переменной типа address
        _; //Выход из модификатора.
    }

    function withdraw(address payable _to) external onlyOwner(_to){
        // require(msg.sender == owner, "you are not an owner!");
        if(msg.sender!=owner){
            revert("ti ne vladelec!");
        } else {}
        _to.transfer(address(this).balance);
    }   
}