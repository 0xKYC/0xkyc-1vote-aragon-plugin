// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity >=0.6.0 <0.9.0;

import {PluginSetup} from '@aragon/osx/framework/plugin/setup/PluginSetup.sol';
import {PermissionLib} from '@aragon/osx/core/permission/PermissionLib.sol';
import './OxKYCPlugin.sol';

contract OxKYCPluginSetup is PluginSetup {
  function prepareInstallation(
    address _dao,
    bytes memory
  ) external returns (address plugin, PreparedSetupData memory preparedSetupData) {
    plugin = address(new OxKYCPlugin(IDAO(_dao), address(0x275D4440342272dB27be480B127410C8bbf78e14)));

    PermissionLib.MultiTargetPermission[] memory permissions = new PermissionLib.MultiTargetPermission[](1);

    permissions[0] = PermissionLib.MultiTargetPermission({
      operation: PermissionLib.Operation.Grant,
      where: plugin,
      who: _dao,
      condition: PermissionLib.NO_CONDITION,
      permissionId: keccak256("VIEW_PERMISSION")
    });

    preparedSetupData.permissions = permissions;
  }
  
  function prepareUninstallation(
    address _dao,
    SetupPayload calldata _payload
  ) external pure returns (PermissionLib.MultiTargetPermission[] memory permissions) {
    permissions = new PermissionLib.MultiTargetPermission[](1);

    permissions[0] = PermissionLib.MultiTargetPermission({
      operation: PermissionLib.Operation.Revoke,
      where: _payload.plugin,
      who: _dao,
      condition: PermissionLib.NO_CONDITION,
      permissionId: keccak256("GRANT_PERMISSION")
    });
  }

  function implementation() external view returns (address) {
  }
}