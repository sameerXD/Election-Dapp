// SPDX-License-Identifier:UNLICENSED
pragma solidity >=0.5.0 <0.9.0;

contract Election{

    // this will hold the information about candidate
    struct Candidate{
        string name;
        uint numVotes;
    }

    // this will hold info about voter 
    // the uint is an int because we will have a list of candidate =>index
    // boolean voted states if the user has already voted or not
    struct Voter{
        string name;
        bool authorised;
        uint whom;
        bool voted;
    }

    // owner of this smart contract
    address public owner;

    // reason for election
    string public electionName;

    mapping(address => Voter) public voters;

    // list of candidates

    Candidate[] public candidates;

    // total number of votes done

    uint public totalVotes;

    // modifiers

    // 1)functions called by owner only

    modifier ownerOnly(){
        require(msg.sender == owner);
        _;
    }
    // 2)function to check if voter has not already voted
    modifier alreadyVoted(){
        require(!voters[msg.sender].voted);
        require(voters[msg.sender].authorised);
        _;
    }
    function startElection(string memory _electionName) public {
        // the person who has started this or deployed this smart contract will be the owner

        owner = msg.sender;

        electionName = _electionName;


    }

    function addCandidate(string memory _candidateName) ownerOnly public{
        // initial votes are 0
        candidates.push(Candidate(_candidateName, 0));

    }

    // the param voter address will be eligible to vote
    function authorizeVoter(address _voterAddress) ownerOnly public{
        voters[_voterAddress].authorised = true;
    }

    // get number of candidates
    function getNumCandidates() public view returns(uint){
        return candidates.length;
    }


    // vote
    function vote(uint candidateIndex)  alreadyVoted public{
        voters[msg.sender].whom = candidateIndex;
        voters[msg.sender].voted = true;
        candidates[candidateIndex].numVotes++;
        totalVotes++;

    }

}