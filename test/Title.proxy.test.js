const { expect } = require('chai');
const { deployProxy } = require('@openzeppelin/truffle-upgrades');

const Title = artifacts.require('Title');

contract('Title (proxy)', function(accounts) {
    beforeEach(async function() {
        this.title = await deployProxy(Title);
    });

    it('should store a URI for each issuance', async function() {
        const vin = "1ZVFT80NX55130466";
        const vinHash = web3.utils.sha3(vin);
        const titleId = web3.utils.toBN(vinHash);
        const titleURI = "https://titles.example/" + vinHash + ".json";
        await this.title.issue(accounts[0], titleId, titleURI);

        expect(await this.title.tokenURI(titleId)).to.equal(titleURI);
    });
});