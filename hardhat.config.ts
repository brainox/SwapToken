// require("@nomiclabs/hardhat-waffle");
import "@nomiclabs/hardhat-ethers";
require("dotenv").config({ path: ".env" });

// const ALCHEMY_RINKEBY_API_KEY_URL = process.env.ALCHEMY_RINKEBY_API_KEY_URL;
// const ALCHEMY_GOERLI_API_KEY_URL = process.env.ALCHEMY_GOERLI_API_KEY_URL;
const INFURA_ROPSTEN_API_KEY_URL = process.env.INFURA_ROPSTEN_API_KEY_URL;

const ACCOUNT_PRIVATE_KEY = process.env.ACCOUNT_PRIVATE_KEY;

module.exports = {
  solidity: "0.8.9",
  networks: {
    // rinkeby: {
    //   url: ALCHEMY_RINKEBY_API_KEY_URL,
    //   accounts: [ACCOUNT_PRIVATE_KEY],
    // },
    // goerli: {
    //   url: ALCHEMY_GOERLI_API_KEY_URL,
    //   accounts: [ACCOUNT_PRIVATE_KEY],
    // },
    ropsten: {
      url: "https://ropsten.infura.io/v3/35fbdcfe4a8a44609cdef4a89eec3614",
      accounts: [ACCOUNT_PRIVATE_KEY],
    }
  }
};


// import { HardhatUserConfig } from "hardhat/config";
// import "@nomicfoundation/hardhat-toolbox";
// import * as dotenv from "dotenv";

// const ACCOUNT_PRIVATE_KEY = process.env.ACCOUNT_PRIVATE_KEY;

// dotenv.config();

// const config: HardhatUserConfig = {
// solidity: "0.8.9",

// networks: {
// hardhat: {
// forking: {
// url: "ropsten.infura.io/v3/35fbdcfe4a8a44609cdef4a89eec3614",
// },
// },
// ropsten: {
// url: process.env.ROPSTEN_URL,
// //@ts-ignore
// accounts: [ACCOUNT_PRIVATE_KEY],
// },
// },
// };

// export default config;