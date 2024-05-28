// SPDX-License-Identifier: AGPL-3.0-only

/*
    IPaymaster.sol - Paymaster
    Copyright (C) 2024-Present SKALE Labs
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

// cspell:words IERC20

import {SKL} from "./types/Skl.sol";
import {USD} from "./types/Usd.sol";


type SchainHash is bytes32;
type ValidatorId is uint256;

interface IPaymaster {
    function initialize(address initialAuthority) external;
    function addSchain(string calldata name) external;
    function removeSchain(SchainHash schainHash) external;
    function addValidator(ValidatorId id, address validatorAddress) external;
    function removeValidator(ValidatorId id) external;
    function setNodesAmount(ValidatorId id, uint256 amount) external;
    function setActiveNodes(ValidatorId id, uint256 amount) external;
    function setMaxReplenishmentPeriod(uint256 months) external;
    function setSchainPrice(USD price) external;
    function setSklPrice(USD price) external;
    function setAllowedSklPriceLag(uint256 lagSeconds) external;
    function setSkaleToken(address token) external;
    function setVersion(string calldata newVersion) external;
    function clearHistory(uint256 before) external;
    function pay(SchainHash schainHash, uint256 duration) external;
    function claim(address to) external;
    function claimFor(ValidatorId validatorId, address to) external;
    function getSchainExpirationTimestamp(
        SchainHash schainHash
    )
        external
        view
        returns (uint256 expiration);
    function getRewardAmount(ValidatorId validatorId) external view returns (SKL reward);
    function getNodesNumber(ValidatorId validatorId) external view returns (uint256 number);
    function getActiveNodesNumber(ValidatorId validatorId) external view returns (uint256 number);
    function getHistoricalActiveNodesNumber(
        ValidatorId validatorId,
        uint256 when
    )
        external
        view
        returns (uint256 number);
    function getHistoricalTotalActiveNodesNumber(
        uint256 when
    )
        external
        view
        returns (uint256 number);
    function getValidatorsNumber() external view returns (uint256 number);
    function getSchainsNames() external view returns (string[] memory names);
    function getSchainsNumber() external view returns (uint256 number);
    function getTotalReward(uint256 from, uint256 to) external view returns (SKL reward);
}
