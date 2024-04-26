require("@nomicfoundation/hardhat-toolbox");

const FORK_FUJI = true
const FORK_MAINNET = false
let forkingData = undefined;

if (FORK_MAINNET) {
  forkingData = {
    url: 'https://api.avax.network/ext/bc/C/rpcc',
  }
}
if (FORK_FUJI) {
  forkingData = {
    url: 'https://api.avax-test.network/ext/bc/C/rpc',
  }
}


/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  networks: {
    hardhat: {
      gasPrice: 225000000000,
      chainId: !forkingData ? 43112 : undefined, //Only specify a chainId if we are not forking
      forking: forkingData
    },
    fuji: {
      url: 'https://api.avax-test.network/ext/bc/C/rpc',
      gasPrice: 225000000000,
      chainId: 43113,
      accounts: [
        // "YOUR PRIVATE KEY HERE"
       '0xbdce3b7453c9a71933b508d695a15881758d98a085be58e0c028a3b638a8d026'
      ]
    },
    mainnet: {
      url: 'https://api.avax.network/ext/bc/C/rpc',
      gasPrice: 225000000000,
      chainId: 43114,
      accounts: [
        // "YOUR PRIVATE KEY HERE"
        '0xbdce3b7453c9a71933b508d695a15881758d98a085be58e0c028a3b638a8d026'
      ]
    }
  }
}

