pragma solidity 0.5.1; 

import "./Storage.sol";

contract Dogs is Storage {  

    constructor() public { 
        owner = msg.sender;
    }

    modifier onlyOwner() { 
        require(msg.sender == owner);
        _;
    }

    function getNumberOfDogs() public view returns(uint256){
        return _uint_storage["Dogs"];
    }

    function setNumberOfDogs(uint256 toSet) public {
        _uint_storage["Dogs"] = toSet;
    }
}