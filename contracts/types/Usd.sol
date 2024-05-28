// SPDX-License-Identifier: AGPL-3.0-only

/*
    Usd.sol - Paymaster
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


type USD is uint256;

using {
    _usdLess as <,
    _usdAdd as +,
    _usdSub as -,
    _usdEquals as ==
} for USD global;

// Operators are used by the library users
// slither-disable-start dead-code

function _usdLess(USD left, USD right) pure returns (bool result) {
    return USD.unwrap(left) < USD.unwrap(right);
}

function _usdAdd(USD a, USD b) pure returns (USD sum) {
    sum = USD.wrap(USD.unwrap(a) + USD.unwrap(b));
}

function _usdSub(USD a, USD b) pure returns (USD sum) {
    sum = USD.wrap(USD.unwrap(a) - USD.unwrap(b));
}

function _usdEquals(USD a, USD b) pure returns (bool result) {
    return USD.unwrap(a) == USD.unwrap(b);
}

// slither-disable-end dead-code
