pragma solidity ^0.4.0;

import "github.com/ethereum/solidity/std/mortal.sol";

contract SimpleWallet is mortal {
    
   
    mapping (address => Permission) myAddressMapping;
    
    
    event someoneAddedSomeoneToTheSendersList(address thePersonWhoAdded,
    address thePersonWhoIsAllowedNow, uint thisMuchHeCanSend);
    
    struct Permission {
    bool isAllowed;
    uint maxTransferAmount;
    }

    function addAddressToSendersList(address permitted, uint maxTransferAmount)
    onlyowner{
    myAddressMapping[permitted] = Permission (true, maxTransferAmount);
    someoneAddedSomeoneToTheSendersList(msg.sender,permitted,maxTransferAmount);
    }  
    
    function sendFunds (address receiver, uint amountInWei){
        if(myAddressMapping[msg.sender].isAllowed){
            if(myAddressMapping[msg.sender].maxTransferAmount >=amountInWei){
                bool isTheAmountReallySent = receiver.send(amountInWei);
                if(!isTheAmountReallySent){
                    throw;
                }else{
                    throw;
                }
            }
            else{
                throw;
            }
            }
        }
    }
