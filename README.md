# TrocEntreAmisMarketPlace

The marketplace Smart Contract is written in Solidity and allows for basic operations on items and with keeping track of ownership based on wallets. The Solidity language can be used on any Ethereum blockchain. It can be found in this repository.

The contract is composed of the following functions:

- findItem: This function takes an ID as input and returns the item struct corresponding to that ID. If the ID is not valid, it reverts the transaction.
- addItem: This function allows a user to add a new item to the contract. It takes the name, description, and value of the item as input, and creates a new item struct with these values. The owner of the item is set to the caller of the function.
- updateItem: This function allows the owner of an item to update its name, description, or value. It takes the ID of the item, as well as the updated name, description, and value, as input. If the caller is not the owner of the item, or if the ID is not valid, it reverts the transaction.
- transferOwnership: This function allows the owner of an item to transfer ownership of the item to a new owner. It takes the address of the new owner and the ID of the item as input. If the caller is not the owner of the item, or if the ID is not valid, it reverts the transaction.

The contract also includes a onlyOwner modifier, which can be applied to functions to restrict them to being called only by the contract owner. The contract owner is set to the sender of the transaction that deploys the contract.
