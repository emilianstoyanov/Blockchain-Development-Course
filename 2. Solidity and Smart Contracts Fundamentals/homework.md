## **Homework: Home Repair Service**


The Home Repair Service is a blockchain-based system that manages requests for home repairs and payments for 
those repairs. The system is designed to simplify the process of requesting and paying for repairs, while also 
ensuring that the repair work is properly audited and approved before payment is made.
The Home Repair Service is run by an administrator who receives repair requests and accepts them. Once a request 
is accepted, it must be executed by the repair team. Then auditors review the repair work to ensure it is completed 
properly. If the repair work is approved by the auditors, payment is made to the repairer. Otherwise, the payment is 
returned to the client.

## **Functionality**

The Home Repair Service contract should allow users to perform the following actions:

1. **Add a repair request**

    Users should be able to add a repair request to the system by providing a request ID and a brief description of 
    the repair work.
    
    Example:
    
    User A wants to repair their roof and submits a repair request to the Home Repair Service contract. The 
    request ID is 1 and the description is "Fix roof leak".


2. **Accept a repair request**

    The system administrator should be able to accept a repair request by providing the request ID.

    Example:

    The system administrator reviews the repair request from User A and accepts it (says that the repair team 
    can handle the request) by providing the request ID and tax in ETH.


3. **Add a payment**

    Users should be able to add a payment to the system for a repair request that has been accepted.

    Example:

    The user adds payment to the Home Repair Service contract by providing the request ID and the amount 
    given by the admin in the previous step. Then the request must be handled by the repairer.

4. **Confirm a repair request**

    After the job is done by the repairer, the system administrator should be able to confirm that a repair request 
    has been completed by providing the request ID.

    Example:

    The repairer completes the roof repair work and notifies the system administrator. The system administrator 
    confirms the repair by providing the request ID.

5. **Verify that the job is done**

    Auditors should be able to verify that the job is done by providing the requested ID.

    Example:

    The auditor reviews the repair and is done well by providing the requested ID. (More than one auditor -> 
    better decentralization.)

6. **Execute a repair request**

    The system should execute a repair request by transferring payment to the repairer if the repair work has been 
    approved by at least two auditors.

    Example:

    The auditor approves the payment, and the Home Repair Service contract executes the request by 
    transferring payment to the repairer.


7. **Money-back**

    The user should execute a money-back request that transfers the payment back to him in case the job is not
    verified for more than 1 month.

8. **Tips for Implementation**

    Here are some tips for implementing the Home Repair Service contract:

        ● Use mappings to store requests, payments, and confirmation status.
        ● Use reverts and errors to restrict access to certain functions.
        ● Use require/custom error statements to validate inputs and prevent errors.