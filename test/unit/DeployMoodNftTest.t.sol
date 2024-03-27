//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import { DeployMoodNft } from "../../script/DeployMoodNft.s.sol";


contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public {
        string memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAwIiBoZWlnaHQ9IjEwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48dGV4dCB4PSIxMCIgeT0iNTAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIyMCIgZmlsbD0iYmxhY2siPkhleSwgeW91ciBicm93c2VyIGRlY29kZWQgdGhpczwvdGV4dD48L3N2Zz4=";
        string memory svg = '<svg width="300" height="100" xmlns="http://www.w3.org/2000/svg"><text x="10" y="50" font-family="Arial" font-size="20" fill="black">Hey, your browser decoded this</text></svg>';
        string memory returnedUri = deployer.svgToImageURI(svg);
        assertEq(expectedUri, returnedUri);
    
    }
}