// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.0;

import "../Structs.sol";
import "../Enums.sol";

import {IEngine} from "../IEngine.sol";
import {ITypeCalculator} from "../types/ITypeCalculator.sol";

import {IMoveSet} from "./IMoveSet.sol";
import {AttackCalculator} from "./AttackCalculator.sol";

contract FireAttack is AttackCalculator, IMoveSet {
    constructor(IEngine _ENGINE, ITypeCalculator _TYPE_CALCULATOR) AttackCalculator(_ENGINE, _TYPE_CALCULATOR) {}

    Type constant TYPE = Type.Fire;
    uint256 constant BASE_POWER = 80;
    uint256 constant ACCURACY = 100;
    uint128 constant STAMINA_COST = 2;

    function move(bytes32 battleKey, uint256 attackerPlayerIndex, bytes calldata, uint256 rng)
        external
        view
        returns (MonState[][] memory, uint256[] memory, IEffect[][] memory, bytes[][] memory)
    {
        return calculateDamage(
            battleKey,
            attackerPlayerIndex,
            BASE_POWER,
            ACCURACY,
            STAMINA_COST,
            TYPE,
            AttackSupertype.Physical,
            rng
        );
    }

    function priority(bytes32) external pure returns (uint256) {
        return 1;
    }

    function stamina(bytes32) external pure returns (uint256) {
        return STAMINA_COST;
    }

    function moveType(bytes32) external pure returns (Type) {
        return TYPE;
    }

    function isValidTarget(bytes32) external pure returns (bool) {
        return true;
    }
}
