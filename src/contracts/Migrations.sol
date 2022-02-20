pragma solidity >=0.7.0<0.9.0;

contract Migrations{
    address public owner;
    uint public last_completed_migration;
    constructor() {
        owner =  msg.sender;
    }
    modifier ownerOnly(){
        if(msg.sender == owner)
        _;
    }
    function set_completed(uint completed) public ownerOnly {
        last_completed_migration = completed;
    }
    function upgrade (address  new_address) public ownerOnly{
        Migrations upgraded = Migrations(new_address);
        upgraded.set_completed(last_completed_migration);
    }
}