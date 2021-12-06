pragma solidity 0.5.1; 

import "./Storage.sol";

contract DogsUpdated is Storage {  

    constructor() public { 
        init(msg.sender);
        
    }

    function init(address _owner) public { 
        require(!_initialized);
        owner = _owner; 
        _initialized = true; 
    }

    modifier onlyOwner() { 
        require(msg.sender == owner);
        _;
    }

    function getNumberOfDogs() public view returns(uint256){
        return _uint_storage["Dogs"];
    }

    function setNumberOfDogs(uint256 toSet) public onlyOwner {
        _uint_storage["Dogs"] = toSet;
    }
}