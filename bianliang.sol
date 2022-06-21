// SPDX-License-Identifier: UnLicense
pragma solidity ^0.8.0;

interface Ilearn3{
      function name() external view returns (string memory);
}

contract hanshu{
    string public name="btctoken";
    string private symbol="BTC";
    string internal key1="keyone";
}
contract hanshu01 is hanshu{
    function GetName() public view returns(string memory){
       string memory name01 =Ilearn3(0xf8e81D47203A594245E36C48e151709F0C19fBe8).name();
        return name;
    }
      function GetKey1() public view returns(string memory){
        return key1;
    }
    function Getkey2() private returns (string memory){
        return key01
    }
}