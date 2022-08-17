// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.10;

import "./IERC20.sol";
interface IERC20 {
    function totalSupply() external view returns (uint);

    function balanceOf(address account) external view returns (uint);

    function transfer(address recipient, uint amount) external returns (bool);

    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint amount) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}
contract TokenSwap {

    IERC20 public tokenA; 
    IERC20 public tokenB; 
    address public alice;
    address public bob;

    constructor(address _tokenA, address _aliceAddress, address _tokenB, address _bobAddress) {
        tokenA = IERC20(_tokenA);
        tokenB = IERC20(_tokenB);
        alice = _aliceAddress;
        bob = _bobAddress;
    }

    /*
     * Transfers amount1 from owner1 to owner2, And thus transfers amount2 from owner2 to owner1.
     *
     * Returns true : If the atomic swap is successful, false : On failure.
     *
     * Requirements : 
     * - 'msg.sender' should be either alice or bob.
     * - amount1 should be approved by alice.
     * - amount2 should be approved by bob.
    */ 
    function swap(uint amount1, uint amount2) public returns (bool) {

        // Has to be called by ALICE or BOB only
        require(msg.sender == alice || msg.sender == bob, "401 Unauthorized Caller");
        
        // Alice has to authorize the required amount to swap contract
        require(tokenA.allowance(alice, address(this)) >= amount1, "Alice has not authorized the required balance");
        
        // Bob has to authorize the required amount to swap contract
        require(tokenB.allowance(bob, address(this)) >= amount2, "Bob has not authorized the requied balance");

        // Actual transfer 
        transferAmount(tokenA, alice, bob, amount1);
        transferAmount(tokenB, bob, alice, amount2);

        return true;
    }

    function transferAmount(IERC20 token, address sender, address recipient, uint amount) private {
        bool transferStatus = token.transferFrom(sender, recipient, amount);
        require(transferStatus, "Transfer failed");
    }
}