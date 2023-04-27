import "@nomicfoundation/hardhat-toolbox";
import "@nomiclabs/hardhat-ethers";
import "@nomiclabs/hardhat-etherscan";
import 'dotenv/config';

const infuraUrlGoerli = process.env.GOERLI_INFURA_URL;
const infuraUrlMumbai = process.env.MUMBAI_INFURA_URL;
const privateKey = process.env.ADMIN_PRIVATE_KEY;

module.exports = {
  defaultNetwork: "hardhat",
  networks: {
    hardhat: {
    },
    goerli: {
      url: `${infuraUrlGoerli}`,
      accounts: [privateKey]
    },
    mainnet: {
      url: `${infuraUrlGoerli}`,
      accounts: [privateKey]
    },
    polygonMumbai: {
      url: `${infuraUrlMumbai}`,
      accounts: [privateKey]
    }
  },
  etherscan: {
    apiKey: {
      mainnet: process.env.ETHERSCAN_API_KEY,
      goerli: process.env.ETHERSCAN_API_KEY,
      polygonMumbai: process.env.POLYGONSCAN_API_KEY,
    }
  },

  solidity: {
    version: "0.8.17",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
  paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts"
  },
  mocha: {
    timeout: 40000
  }
};