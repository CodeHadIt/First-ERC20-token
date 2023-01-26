//SPDX-License-Identifier: MIT

pragma solidity ^0.8.5;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

//"is"allows us to inherit from the imported url
contract MyToken is ERC20 {
    address public admin;
    //our constructor. It will run only on deployment of our contract, as well as our imported constructor
    constructor () ERC20("Code Hadit", "CHT"){
        //on deployment we're minting all the token to our address.(line 251)
        _mint(msg.sender, 1000 * 10 ** 18);
    }

    //function to allow us mint more token
    function mint(address to, uint amount) external {
        //require is needed as it controls who can mint the token
        require(msg.sender == admin, "only admin can mint");
        _mint(to, amount);
    }

    //function to burn token (line 277)
    function burn(uint amount) external {
        _burn(msg.sender, amount);
    }
}