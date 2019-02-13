const HDWalletProvider = require("truffle-hdwallet-provider");
const config = require("../config.json");
console.log(JSON.stringify(config))
Object.keys(config).forEach((key) => {
    let network = config[key];
    if (network.provider_data) {
        network.provider = () => new HDWalletProvider(network.provider_data.wallet_private_key, network.provider_data.http_endpoint);
    }
});

module.exports = {
    networks: config
};

