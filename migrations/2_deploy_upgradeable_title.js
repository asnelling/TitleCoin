const { deployProxy } = require('@openzeppelin/truffle-upgrades');

const Title = artifacts.require("Title");

module.exports = async function (deployer) {
    await deployProxy(Title, { deployer });
}