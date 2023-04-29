// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract FundRaiser {
    // uint > positive number
    // int > negative number
    uint256 public shares;

    // the function will only be available externally > external
    function addShares(address receiver, uint256 amount) external  {
        shares += amount;
    }

    // the function returns us our address
    function whoAmI() public view returns (address) {
        return msg.sender;
    }

    // function returns us our contract address
    function contractAddress() external view returns (address) {
        return address(this);
    }

    // the function returns true or false 
    // we use 'pure' because all the state we read is in this function. We do not touch the state of the contract
    function istrue() public pure returns (bool) {
        bool here;
        return here;
    }
}