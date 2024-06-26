// SPDX-License-Identifier: AGPL-3.0-only

/*
    Skl.sol - Paymaster
    Copyright (C) 2023-Present SKALE Labs
    @author Dmytro Stebaiev

    Paymaster is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Paymaster is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with Paymaster.  If not, see <https://www.gnu.org/licenses/>.
*/

pragma solidity ^0.8.20;


type SKL is uint256;

using {
    _sklLess as <,
    _sklAdd as +,
    _sklSub as -,
    _sklEquals as ==
} for SKL global;

// Operators are used by the library users
// slither-disable-start dead-code

function _sklLess(SKL left, SKL right) pure returns (bool result) {
    return SKL.unwrap(left) < SKL.unwrap(right);
}

function _sklAdd(SKL a, SKL b) pure returns (SKL sum) {
    sum = SKL.wrap(SKL.unwrap(a) + SKL.unwrap(b));
}

function _sklSub(SKL a, SKL b) pure returns (SKL sum) {
    sum = SKL.wrap(SKL.unwrap(a) - SKL.unwrap(b));
}

function _sklEquals(SKL a, SKL b) pure returns (bool result) {
    return SKL.unwrap(a) == SKL.unwrap(b);
}

// slither-disable-end dead-code
