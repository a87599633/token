// SPDX-License-Identifier:     MIT
pragma solidity ^0.8.0;
contract Token{
    string  public TokenName="BTCToken";//代币名称
    string  public TokenSymbol="BTC";   //代币符号
    uint8 public decimal=8;//-代币精度
    uint256 public TokenMaxSupply=100000000*10**8;//代币发行总量
//    uint256 public TokenSupply=0；//合约地址剩余代币数量  此处报错
    address public adminAccount;//管理员账户地址
    mapping(address=>uint256) public balance;//余额查询
    address public ownerAddress;// = 0x203282708C2fA95285146345cC4d0380251286ce;//权限拥有者
    address public feeAccount;//费用地址
    uint256 public feeNum;//费用比例

//构造函数；在部署合约前先添加一个地址，不添加
     constructor (address _feeAccount,uint256 _feeNum)public{
        feeAccount=_feeAccount;
        feeNum=_feeNum;//solidity不识别小数，所以次数在后期计算的话要除以相应的比例 
                        //如：费用千分之3,部署是输入3 后期计算比例就是3/1000
        ownerAddress=msg.sender;//部署合约的发起者为权限拥有者   msg.sender谁调用了它就返回谁的地址
       // from=msg.sender;
     }

     //判断必须是owner,如果不是,停止执行后面的函数
    modifier onlyOwner{
        require(msg.sender == ownerAddress,"isn't owner");
        _;   //占位符
    }

    //部署合约后修改费用比例  耍无赖bug 接受地址皆可改变 只要你想
    function setfeeNum(uint256 _feeNum)public onlyOwner{
        feeNum=_feeNum;
    }

//设置管理员地址.
   

    function setadminAccount(address account)public {
            adminAccount=account;
}




//从地址a转账到另一个地址 
    

     function tansferfrom(address to,uint256 amount) public {
            balance[msg.sender] -= amount;
            balance[to] += amount;
     }

    

    
//给指点地址发送代币  
     function mint(address account,uint256 amount)public onlyOwner{
        balance[account]+=amount; 
     }  

     
}