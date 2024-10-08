// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.0;

import {IRandomnessOracle} from "../../src/rng/IRandomnessOracle.sol";

contract MockRandomnessOracle is IRandomnessOracle {
    uint256 rng;

    function setRNG(uint256 a) public {
        rng = a;
    }

    function getRNG(bytes32, bytes32) external view returns (uint256) {
        return rng;
    }
}
