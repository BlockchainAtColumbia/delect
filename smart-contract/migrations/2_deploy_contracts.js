var Contract = artifacts.require("./Elections.sol");
module.exports = function(deployer) {
    deployer.deploy(Contract);
};
