let Elections = artifacts.require("Elections");

module.exports = async function(callback) {
    let elections = await Elections.deployed();
    let electionsUNIs= [["1","2"],["3","4","5"],["6","7","8","9","10"]].map(x => x.map(web3.utils.asciiToHex));
    for(var i = 0; i < electionsUNIs.length; i++) {
        await elections.addElection(electionsUNIs[i]);
    }
    let UNIs = await elections.getElectionUNIs(0);
    console.log(UNIs);
    await elections.startElections();

    callback();
}
