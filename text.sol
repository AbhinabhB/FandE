// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract EContract {
    address public owner;
    uint public num;
    uint public value;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function setValue(uint _value)  public onlyOwner {
        require(_value > 10, "Value must be greater than 10");
        value = _value;
    }

    function checkNum(uint number) view  public onlyOwner returns (uint) {
        assert(number > 0);
        return num + number;
    }

    function safeNum(uint _a, uint _b) public pure returns (uint) {
        if (_b + _a < 10) {
            revert("The value does not add upto the required quantity!");
        }
        return _a + _b;
    }
}
