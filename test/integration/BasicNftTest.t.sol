//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {BasicNft} from "../../src/BasicNft.sol";
import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {DeployBasicNft} from "../../script/DeployBasicNft.s.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address public USER = makeAddr("user");
    string public constant PUG =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

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

    function testTokenCounterIncreasesOnMint() public {
        assertEq(basicNft.getTokenCounter(), 0);
        vm.prank(USER);
        basicNft.mintNft(PUG);
        assertEq(basicNft.getTokenCounter(), 1);
    }

    function testCanMintAndHaveABalance() public {
        assertEq(basicNft.balanceOf(USER), 0);
        vm.prank(USER);
        basicNft.mintNft(PUG);
        assertEq(basicNft.balanceOf(USER), 1);
        assertEq(basicNft.ownerOf(0), USER);
        assertEq(keccak256(abi.encodePacked(basicNft.tokenURI(0))), keccak256(abi.encodePacked(PUG)));
    }
}
