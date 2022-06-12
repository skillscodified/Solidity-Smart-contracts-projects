//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;

contract BuyPassForSchoolProgram {
 

 // its just buy pass Example or Logic .you can Change in you Demands
 // there 3 functions

 address Manger ;
 uint public passprice ;
 uint public Minimumpass = 1;
//  uint public  time = 3600 + block.timestamp;
 uint public RecquiredAmount = 10 ether;
 uint public passesAmount = 0 ;
 uint public totalPass;
 uint pass ;
//.. struct of Member of function
 struct person{
   uint id ;
   uint passAmount;
   bool paid;
   uint MypassCount;
   
 }
// Map into struct
mapping (address => person) public Persons;
mapping(uint=>address) public Raccount;


constructor(uint TotalPass){
    Manger = msg.sender;
    totalPass =TotalPass;
}
// Check pass  
function CheckPass(uint Pass) public{
  require(totalPass>1,"pass over");
    pass = Pass;
    require (Persons[msg.sender].id<1,"user Already Buyed");
    if (Pass >= Minimumpass){
        for(uint i = 0 ; i < Pass ; i++){
           passprice = passprice + 1 ether;
    }
    }
}
//pay for pass
 function payprice() public payable{
  require(passprice == msg.value,"please update correct Value");
    Persons[msg.sender].paid=true;
     Persons[msg.sender].passAmount = msg.value;
     Persons[msg.sender].id++;
     Persons[msg.sender].MypassCount = pass;
     totalPass = totalPass - pass;
     passesAmount = passesAmount + passprice;
     passprice = 0;
     pass = 0;
     
     
} 
//if reQuirmeants not Done of function you can refund your amount

function Refund(address payable Rec) public {
    //  require(time == block.timestamp,"time Remining");
     require(Persons[msg.sender].paid == true,"your not paid");
     require(RecquiredAmount>passesAmount,"not Refund Reuored amount is done");
     Rec.transfer(Persons[Rec].passAmount);
}

 

}
  

 
