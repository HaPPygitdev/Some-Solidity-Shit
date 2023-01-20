//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./IL.sol";
contract Demo {
    IL logger;

    constructor(address _logger){
        logger = IL(_logger);
    }

    function payment(address _from, uint _number) public view returns(uint){
        return logger.getEntry(_from, _number);
    }

    receive() external payable{
        logger.log(msg.sender, msg.value);
    }
    
}