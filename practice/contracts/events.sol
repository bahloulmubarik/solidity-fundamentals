
    // SPDX-License-Identifier: MIT
    pragma solidity 0.8.22;

    contract SimpleEventContract {

    event ItemPurchased(address indexed buyer, uint256 amount);

        function purchaseItem() external payable {               
        // Trigger the event
        emit ItemPurchased(msg.sender, msg.value);
     }
    }




