pragma solidity ^0.8.0;
contract hanshu{  //合约名称
    uint8 c;
    function add(uint8 x,uint8 y) public view returns(uint8){
        return x+y;
    }
      /*函数 及名称（函数类型可以一个也可多个，中间，隔开）
      访问权限pubilc 返回(返回值类型)  
      上面函数也写成：
      function add(uint8 x,uint8 y) public view returns(uint8 z){z=x+y;}
       且返回的值类型必须与前面的相同  函数没有改变数值的不消耗gas  */
    function add1(uint8 x,uint8 y) public{
        c=x+y;
    }
}
