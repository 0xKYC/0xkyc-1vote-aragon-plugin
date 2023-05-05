## Project Title: 0xKYC-1VOTE-ARAGON_PLUGIN

### Hackathon: [Aragon] Best Decision-Making Plugin ([DAO Global Hackathon](https://daoglobalhackathon.hackerearth.com/))

## Overview

Our plug-in 1VOTE, aims to develop an innovative Proof of Uniqueness decision-making plugin for Aragon OSx that allows DAOs to easily adapt and evolve their governance mechanisms. Our Proof of Uniqueness is a based on a biometric scan (selfie). After the selfie scan we assign a unique identifier (UUID) to that user and every additional instance of that user is minted with the same UUID. This networks users accross wallets and allows protocols to set mechanisms such that each user has a single verified vote.

## Features

- Easy installation and uninstallation of decision-making plugins
- Customizable membership criteria for each governance protocol
- Proof of Uniqueness via id & selfie scan to ensure one verified vote 
- Sanctions and AML screening

## Instructions

1. Clone the repository:

\`\`\`
git clone https://github.com/0xKYC/0xkyc-1vote-aragon-plugin
\`\`\`

2. Navigate to the project directory:

\`\`\`
cd 0xkyc-1vote-aragon-plugin
\`\`\`

3. Install dependencies:

\`\`\`
npm install
\`\`\`

4. Create .env file using .env.sample file:

\`\`\`
ADMIN_PUBLIC_KEY=
ADMIN_PRIVATE_KEY=
GOERLI_INFURA_URL=
MUMBAI_INFURA_URL=
ETHERSCAN_API_KEY=
POLYGONSCAN_API_KEY=
\`\`\`

5. Compile the contracts:

\`\`\`
$ npx hardhat compile
\`\`\`

6. Deploy the contracts:

\`\`\`
$ npx hardhat deploy scripts/deploy.ts
\`\`\`

7.Then, go to the PluginFactory contract on Etherscan and deploy the first version of your plugin
`https://goerli.etherscan.io/address/0x301868712b77744A3C0E5511609238399f0A2d4d#writeContract`

8. Access the plugin in the Aragon Subgraph by visiting and query: `https://subgraph.satsuma-prod.com/aragon/osx-goerli/playground`.

\`\`\`
query GetPlugins {
  pluginRepos {
      subdomain
    }
}
\`\`\`

## Documentation

Detailed documentation on how to build, publish, and integrate Aragon OSx plugins can be found in the [Developer Portal](https://devs.aragon.org/docs/osx/).

## Team

Adam : Project Manager
- [LinkedIn](https://www.linkedin.com/in/azasada/)
Dlan  - Blockchain Developer
- [LinkedIn](https://www.linkedin.com/in/dylanwysocki)
Min-Gyun - Backend Developer
- [LinkedIn](https://www.linkedin.com/in/philip-nomad)
Sebastian - Frontend Developer
- [LinkedIn](https://www.linkedin.com/in/sebastian-oldak)
Kamil - Frontend Developer
- [LinkedIn](https://www.linkedin.com/in/dzieniszewski/)


## License

This project is licensed under the MIT License.
