// SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

contract TrocEntreAmis {
    // ContractOwner
    address private contractOwner = msg.sender;
    
    modifier onlyOwner() {
        require(msg.sender == contractOwner, "Not permitted");
        _;
    }
    // Item
    struct Item {
        address owner;
        uint id;
        string name;
        string description;
        uint value;
    }
    
    Item[] items;
 
    function findItem(uint id) public view returns(Item memory) {
        if(id >= items.length)
            revert('Not found');

        return items[id];
    }
    
    function addItem(string memory name, string memory description, uint value) public {
        items.push(
           Item({owner: msg.sender, id: items.length, name: name, description: description, value: value}));
    }
    
    function updateItem(uint id, string memory name, string memory description, uint value) public returns(Item memory) {
        require((id < items.length) && (msg.sender == items[id].owner));

       
        items[uint(id)].id = id;
        items[uint(id)].name = name;
        items[uint(id)].description = description;
        items[uint(id)].value = value;

        return items[uint(id)];
    }

    function transferOwnership(address newOwner, uint id) 
    public {
        require((id < items.length) && (msg.sender == items[id].owner));

        items[uint(id)].owner = newOwner;
    }
}
