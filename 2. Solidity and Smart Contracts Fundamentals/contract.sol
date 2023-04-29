// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract FundRaiser {
    // we say what type the key and value will be
    mapping(address => uint) public shares;
    // uint > positive number
    // int > negative number
    uint256 public totalShares;
       enum Options {
        One,
        Two,
        Three
    }
    uint256 public number;

    // the function will only be available externally > external
    function addShares(address receiver, uint256 amount) external  {
        totalShares += amount;
        shares[receiver] += amount;
    }

    // the function returns us our address
    function whoAmI() public view returns (address) {
        return msg.sender;
    }

    // the function returns us our contract address
    function contractAddress() external view returns (address) {
        return address(this);
    }

    // the function returns true or false 
    // we use 'pure' because all the state we read is in this function. We do not touch the state of the contract
    function istrue() public pure returns (bool) {
        // bool here = true;
        bool here;
        return here;
    }

     function getEnum(Options option) external pure returns (Options) {
       return option;
    }

    // It's not "pure" or "view" because we're going to change the state
    function increase() external returns (uint256) {
        number++;
        return number;
    }



}