# TitleToken

A work-in-progress [ERC721](https://eips.ethereum.org/EIPS/eip-721) implementation of tokenized vehicle titles on the Ethereum blockchain.

## Overview

In lieu of arcaic paper titles, a state's Department of Motor Vehicles may issue a token that has:

1. An owner, or their agent, who is authorized to transfer the token - "assign the title to a new owner"

2. A URI to a file that includes the same details as on the first page of a paper title. This could be an immutable or somehow append-only JSON file.

## API

### Issuance

```Solidity
function issue(address dealer, uint256 titleId, string memory titleURI)
```

When a brand new vehicle arrives at the lot, the DMV issues to the dealer a fresh title, whose `titleURI` references a resource (on IPFS) that identifies the vehicle. The globally-unique `titleId` may be a hash of the VIN or picked at random.

### Assignment

```Solidity
function assign(address seller, address buyer, uint256 titleId)
```

Transfer ownership of the vehicle to `buyer`. The sender of the transaction may not necessarily be the `seller`. The seller may authorize some agent to assign the title on their behalf.

## Running the tests

```Shell
# with coverage (supposed to be slower)
npm run coverage

# without
npm test
```

This will run tests on a fresh, local Ethereum network, compiling and deploying the contracts as necessary.

## Deployment

Compile the contracts

```Shell
./node_modules/.bin/truffle compile
```

Run migrations

```Shell
./node_modules/.bin/truffle migrate
```

If you need a local network to deploy the contract to (run migrations), run this in a background terminal.

```Shell
./node_modules/.bin/truffle develop
```

## Further considerations

- Where to put important data from the assignment/sale of a vehicle, such as: odomoter reading, sale price, tax, [branding](https://en.wikipedia.org/wiki/Vehicle_title_branding)

  Some mechanism to allow appending this data to the resource pointed at by `titleURI`, while prohibiting any other modifications seems likely. It may be quite costly to store this information on-chain, so keeping this off-chain may be ideal.

- Tracking lienholders and granting them some control over the title.
    
  [Access Control](https://docs.openzeppelin.com/contracts/3.x/access-control) seems promising.

- UI for administering titles
