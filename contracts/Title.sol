// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.6.0;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";

/**
 * @title Tokenized Vehicle Title
 */
contract Title is ERC721Upgradeable {
    function initialize() public initializer {
        __ERC721_init("Auto Title Token", "ATT");
    }

    /**
     * Issue a fresh title for a brand new car.
     *
     * The regulatory body (Department of Motor Vehicles) issues a fresh title to an auto dealer for each brand new vehicle in inventory.
     * 
     * @dev tokenURI points to a JSON file conforming to the ERC721 Metadata JSON Schema
     * @param dealer Auto dealer receiving the car from the manufacturer.
     * @param titleId Uniquely identifies this new title
     * @param titleURI Location of the title/vehicle details in JSON
     */
    function issue(address dealer, uint256 titleId, string memory titleURI) public
    {
        _safeMint(dealer, titleId);
        _setTokenURI(titleId, titleURI);
    }
}
