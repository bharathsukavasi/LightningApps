@istest
public class SalesTerritoryScheduleTest {
    
    @istest public static void  testschedule() {
        Test.StartTest();
        SalesTerritorySchedule STerritorySchedule= new SalesTerritorySchedule();
        String sch = '0 0 23 * * ?';
        system.schedule('Test status Check', sch, STerritorySchedule );
        Test.stopTest();
        
    }
}