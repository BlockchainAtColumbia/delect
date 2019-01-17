pragma solidity ^0.5.0;

contract Elections {
    address manager;
    uint stage;
    bytes32 privateKey;

    uint electionsCount;
    mapping (uint => Election) elections;
    mapping (bytes32 => Ballot) ballots;

    modifier onlyManager () {
        require(msg.sender == manager);
        _;
    }

    modifier onlyStage (uint enforcedStage) {
        require(enforcedStage == stage);
        _;
    }

    struct Election {
        bytes32[] UNIs;
        mapping (bytes32 => Candidate) candidates;
    }

    struct Candidate {
        bool exists;
        uint votes;
    }

    struct Ballot {
        bool exists;
        bytes32[] candidates;
    }

    constructor () public {
        manager = msg.sender;
        stage = 0;
    }

    function addElection (bytes32[] memory UNIs) public onlyManager() onlyStage(0) {
        Election storage election = elections[++electionsCount];
        election.UNIs = UNIs;
        for (uint i = 0; i < UNIs.length; i++) {
            election.candidates[UNIs[i]].exists = true;
        }
    }

    function startElections () public onlyManager() onlyStage(0) {
        stage = 1;
    }

    function vote (bytes32 voterEncryptedUNI, bytes32[] memory candidates) public onlyManager() onlyStage(1) {
        require(candidates.length == electionsCount);
        require(!ballots[voterEncryptedUNI].exists);

        for (uint i = 0; i < electionsCount; i++) {
            require(elections[i].candidates[candidates[i]].exists);
            elections[i].candidates[candidates[i]].votes++;
        }

        ballots[voterEncryptedUNI].candidates = candidates;
        ballots[voterEncryptedUNI].exists = true;
    }

    function endElections () public onlyManager() onlyStage(1) {
        stage = 2;
    }

    function releaseElectionsResults (bytes32 _privateKey) public onlyManager() onlyStage(2) {
        privateKey = _privateKey;
    }

    function getBallot (bytes32 voterEncryptedUNI, uint index) public view returns (bytes32) {
        require(ballots[voterEncryptedUNI].exists);
        return ballots[voterEncryptedUNI].candidates[index];
    }

    function getVotesCount (uint electionId, bytes32 candidate) public view returns (uint) {
        return elections[electionId].candidates[candidate].votes;
    }

}
