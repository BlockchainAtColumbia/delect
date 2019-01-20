const HDWalletProvider = require("truffle-hdwallet-provider");
const config = require("./config.json");

module.exports = {
	networks: {
		ropsten: {
			provider: () => new HDWalletProvider(config.wallet_private_key, "https://rinkeby.infura.io/v3/" + config.infura_api_key),
			network_id: 4,
			gas: 3000000,
			gasPrice: 10000000000
		}
	}
};
