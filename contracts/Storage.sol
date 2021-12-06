pragma solidity 0.5.1;

contract Storage{ 
    mapping (string => string) _str_storage;  
    mapping (string => uint256) _uint_storage;
    mapping (string => address) _address_storage;
    mapping (string => bool) _bool_storage;  
    mapping (string => bytes4) _bytes_storage;  
    address public owner; 
    bool public _initialized; 


}