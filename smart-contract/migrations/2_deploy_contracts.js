var Contract = artifacts.require("./Election.sol");
module.exports = function(deployer) {
    deployer.deploy(Contract);
};
