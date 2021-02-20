@isTest
public class Test_AccountApexController {

    private static testmethod void testAccount(){
    account acc= AccountApexController.getAccountInfo('0012v00002V2k82AAB');
       List<Account> accList=AccountApexController.getAccounts('0012v00002V2k82AAB') ;
    }
     private static testmethod void testAccount2(){
    //account acc= AccountApexController.getAccountInfo('0012v00002V2k82AAB');
       List<Account> accList=AccountApexController.getAccounts('0012v00002V2k82AAB') ;
    }
    private static testmethod void tesAccountObjController(){
    //account acc= AccountApexController.getAccountInfo('0012v00002V2k82AAB');
       List<Account> accList=AccountObjController.getaccounts() ;
    }
    
}