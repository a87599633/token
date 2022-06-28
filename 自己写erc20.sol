// SPDX-License-Identifier:     MIT
pragma solidity ^0.8.0;

contract erc2020{
    mapping(address => uint256)private _balances;
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    uint256 private _totalSupply; //流通总量
    uint256 private _maxTotalSupply;  //最大总量
    address public owner;
    modifier onlyOwner{
        require(msg.sender==owner,"not owner"); //判断必须是owner,如果不是,停止执行后面的函数
        _;   
    }
    
//构造函数 部署合约前先要确认的一些相关信息
    constructor(string memory name,string memory symbol,uint8 decimals,uint256 maxSupply)public{
        _name = name; 
        _symbol = symbol;
        _decimals =decimals;
        _maxTotalSupply=maxSupply;
        owner = msg.sender;
    }

    //设置owner
    function setOwner(address _owner) public{
        owner=_owner;
    }
   
    function name()public view returns(string memory){
        return _name;
    }
    function symbol()public view returns(string memory){
        return _symbol;
    }
    function decimals()public view returns(uint8){
        return _decimals;
    }
    function totalSupply()public view returns(uint256){
        return _totalSupply;
    }
    function maxTotalSupply()public view returns(uint256){
        return _maxTotalSupply;
    }
    function balanceOf(address account)public view returns(uint256){
        _balances[account];
    }
    function tansfer(address to,uint256 amount)external returns(bool){
        address from=msg.sender;
        uint256 fromBalances=_balances[from];
        require (fromBalances>=amount,"Over user balances");
        _balances[from]-=amount;
        _balances[to] += amount;
        return true;
    }
     function mint(address to,uint256 amount)public onlyOwner {
         //流通总量不能大于最大流通总量，如果不设置最大流通总量 此币可以无限增发
        require(_totalSupply+amount<=_maxTotalSupply,"over Supply");
        _totalSupply+=amount;
        _balances[to]+=amount;
    }
}