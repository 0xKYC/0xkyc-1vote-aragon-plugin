// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity >=0.6.0 <0.9.0;

import {Plugin, IDAO} from '@aragon/osx/core/plugin/Plugin.sol';

interface IOxKYC {

        function hasSoul(address _soul) external view returns (bool);
        function getUUIDData(address _address) external view returns (string memory);
}

contract OxKYCPlugin is Plugin {
    IOxKYC public myOxKYC;
    mapping (string => address[]) public UuidToAddresses;
    bytes32 public constant VIEW_PERMISSION_ID = keccak256("VIEW_PERMISSION");
    
    constructor(IDAO _dao, address _OxKYC) Plugin(_dao) {
        myOxKYC = IOxKYC(_OxKYC);
    }


    function trackUUIDs(address _address) external  auth(VIEW_PERMISSION_ID) returns (address[] memory){

        string memory userUUID = myOxKYC.getUUIDData(_address);
        UuidToAddresses[userUUID].push(_address);
        return UuidToAddresses[userUUID];
    }

    function getUUID(address _address) external view auth(VIEW_PERMISSION_ID) returns (string memory){

        return myOxKYC.getUUIDData(_address);
    }

    function hasSoul(address _soul) external view auth(VIEW_PERMISSION_ID) returns (bool){

        return myOxKYC.hasSoul(_soul);
    }
}