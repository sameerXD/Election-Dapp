// SPDX-License-Identifier:MIT

pragma solidity >=0.6.6 < 0.9.0;

contract FundMe{
    mapping(address => uint256) public fundToAddress ;

    function fund() public payable{
        fundToAddress[msg.sender] += msg.value;
    }

}

