// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract FundRaiser {
    // uint > positive number
    // int > negative number
    uint256 public totalShares;
    // we say what type the key and value will be
    mapping(address => uint) public shares;
    address public owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    uint256 public number;

       enum Options {
        One,
        Two,
        Three
    }

    error Unauthorized(string reason);

    // the function will only be available externally > external
    // the function adds the shares of a given investor
    function addShares(address receiver, uint256 amount) external payable  {
        // if the address is the same as the owner's, no shares should be sent
        // require(msg.sender == owner, "Now owner");

        // if the address is the same as the owner's, no shares should be sent
        // if(msg.sender == owner) {
        //     return;
        // }
        // If the address is the same as the owner's, to display a message
        if(msg.sender == owner) {
            revert Unauthorized("Now Owner");
        }
        totalShares += amount;
        shares[receiver] += amount;
    }

    // the function displays the holdings of a given investor
    function getShares(address investor) external view returns (uint256) {
        return shares[investor];
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

    // function returns the seconds
    function getSeconds() external pure returns (uint256) {
        return 60 minutes;
    }



}