import { ethers } from "hardhat";

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);
  console.log("Account balance:", (await deployer.getBalance()).toString());

  const getOxKYCSetup = await ethers.getContractFactory("OxKYCPluginSetup");
  const OxKYCSetup = await getOxKYCSetup.deploy();

  await OxKYCSetup.deployed();

  console.log("0xKYC Plugin address:", OxKYCSetup.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
