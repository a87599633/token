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
    address[] public users; //数组类型
    address public feeAccount;//费用地址
    uint256 public feeNum;//费用比例

//构造函数；在部署合约前先添加一个地址，不添加
     constructor (address _feeAccount,uint256 _feeNum)public{
        feeAccount=_feeAccount;
        feeNum=_feeNum;//solidity不识别小数，所以次数在后期计算的话要除以相应的比例 
                        //如：费用千分之3,部署是输入3 后期计算比例就是3/1000
        ownerAddress=msg.sender;//部署合约的发起者为权限拥有者
     }

     //判断必须是owner,如果不是停止执行后面的函数
    modifier onlyOwner{
        require(msg.sender == ownerAddress,"isn't owner");
        _;   //占位符
    }

    //部署合约后修改费用比例  耍无赖bug 
    function setfeeNum(uint256 _feeNum)public onlyOwner{
        feeNum=_feeNum;
    }
//设置管理员地址.
   

    function setadminAccount(address account)public {
            adminAccount=account;
}




//从地址a转账到另一个地址 此处可以加判断转出地址代币是否足够  转账功能已实现 
     function tansferfrom(address form,address to,uint256 amount) public {
        balance[form] -= amount;
         balance[to] += amount;
  }

    function tansfer(address form,uint256 amount) public {
            balance[form] -= amount;
    }

//判断转出地址代币事故足够 报错，不知道什么原因 
//  if（amount<=blance[form]）{   
//            balance[form] -= amount;
//            balance[to] += amount;
//        }
//         else "shibai";
    
//给指点地址发送代币  判读剩余总量是否有足够代币转出
     function mint(address account,uint256 amount)public onlyOwner{
 //        TokenSupply=TokenMaxSupply;
         if (amount<=TokenMaxSupply){
 //               TokenSupply=TokenMaxSupply-amount;
                balance[account]+=amount;
  //              return TokenSupply;
         }
         else{
            balance[account];//return "error";加此报错  不值何故
         }
         
     }  

     
// //添加用户
//      function addUser(address user) public{
//          users.push(user);
//      }


// //for循环添加
//     // function loop(uint8 index)public view returns(address){
//     //     address user;
//     //     for (uint8 i=0;i<users.lenght; i++){
//     //         user=users[i];
//     //         if (i==index){
//     //             break;  //判断值是否等于设置值 等于结束循环
//     //         }
//     //     }
//     //     return user;
//     // }

}