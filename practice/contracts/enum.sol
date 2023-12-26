
  
  
   // SPDX-License-Identifier: MIT
   pragma solidity 0.8.22;

   contract EnumIntro{
    
    // Enum definition for the status of an order
    enum Status{
        shipped,    
        accepted,   
        rejected
    }
    Status public  status;

    function ship() public {  //ship function to cheak order                      
        status = Status.shipped;
    }
    function AcceptDelivery() public{ //it cheak whether accept                       
        require(status ==Status.shipped);
        status = Status.accepted;
    }
    function rejectDelivery() public{ //reject function                            
        require(status == Status.shipped);
        status = Status.rejected;
    }
   }

