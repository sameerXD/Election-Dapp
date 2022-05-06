// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "./SimpleStorage.sol";

contract FactoryStorage is SimpleStorage{
    // array to store our new simpleStorage smart contracts

    SimpleStorage[] public simpleStorageArray;

    // function to create new SimpleStorage smart contracts object and push it to array

    function simpleStorageStore ()public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);

    }

    // function to call store menthod of a smart contract stored at some index of simpleStorageArray
    
    function sfStore(uint256 _simpleStorageArrayIndex, uint256 _unit) public{
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageArrayIndex]));
        simpleStorage.store(_unit);
    }

    // view method to see the inserted store number in the simpleStorage object from array

    function retrieveSfStore(uint256 _simpleStorageArrayIndex) public view returns (uint256){
        SimpleStorage simpleStorage = SimpleStorage(simpleStorageArray[_simpleStorageArrayIndex]);
        return simpleStorage.retrieve();
    }
}