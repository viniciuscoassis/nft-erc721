//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {BasicNft} from "../src/BasicNft.sol";
import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployer;
    BasicNft public basicNft;

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Dogie";
        string memory actualName = basicNft.name();
        //array of bytes
        assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));
    }
}
