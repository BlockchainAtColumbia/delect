let Election = artifacts.require("Election");
contract("Election", () => {
    let election;

    before(async () => {
        election = await Election.deployed();
    });

    test
});
