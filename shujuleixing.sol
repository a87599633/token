pragma solidity ^0.8.0;

//import "hardhat/console.sol";

contract Token{

 	string  public name="BTC Token";  //代币名称
	string public symbol="BTC";  //代币符号
  	uint8 public decimal=18;	//代币精度
	uint256 public totalSupply=100000000000000000000000; //代币总量
	bool public isBird;
	
	//function Dog(uint8 dog) public{
	//	if(dog==0)
   //     {
	//	    isBird=false;	
	//	}
	//}
	//function setAdminAccount(address account) public{
	//	adminAccount=account;
	//}
	//function mint(address account,uint256 amount) public{
	//	balance[account]=amount;
	//}
}