// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.0;

import {IMoveSet} from "./moves/IMoveSet.sol";
import {IValidator} from "./IValidator.sol";
import {IEffect} from "./effects/IEffect.sol";
import {Type} from "./Enums.sol";

struct Battle {
    address p0;
    address p1;
    IValidator validator;
    Mon[][] teams;
}

struct BattleState {
    uint256 turnId;
    uint256 playerSwitchForTurnFlag;
    MonState[][] monStates;
    uint256[] activeMonIndex;
    RevealedMove[][] moveHistory;
    uint256[] pRNGStream;
    address winner;
    IEffect[] globalEffects;
    bytes[] extraDataForGlobalEffects;
}

struct Mon {
    uint256 hp;
    uint256 stamina;
    uint256 speed;
    uint256 attack;
    uint256 defence;
    uint256 specialAttack;
    uint256 specialDefence;
    Type type1;
    Type type2;
    Move[] moves;
}

struct MonState {
    int256 hpDelta;
    int256 staminaDelta;
    int256 speedDelta;
    int256 attackDelta;
    int256 defenceDelta;
    int256 specialAttackDelta;
    int256 specialDefenceDelta;
    bool isKnockedOut; // Is either 0 or 1
    IEffect[] targetedEffects;
    bytes[] extraDataForTargetedEffects;
}

struct Move {
    IMoveSet moveSet;
    uint256 moveId;
}

struct Commitment {
    bytes32 moveHash;
    uint256 turnId;
    uint256 timestamp;
}

struct RevealedMove {
    uint256 moveIndex;
    bytes32 salt;
    bytes extraData;
}
