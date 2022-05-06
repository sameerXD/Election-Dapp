// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract SimpleStorage{
    uint256 public favouriteNumber ;

    struct People{
        uint256 favouriteNumber;
        string name;
        
    }

    People[] public people;

    mapping(string=>uint256) public nameToFavNumber;


    function addPerson(string memory _name, uint256 _favouriteNumber) public{
        people.push(People({
            favouriteNumber:_favouriteNumber,
            name:_name
        }));

        nameToFavNumber[_name] = _favouriteNumber;
    }

    function store(uint256 unit) public{
        favouriteNumber = unit;
    }

    function retrieve() public view returns(uint256){
        return favouriteNumber;
    }
}