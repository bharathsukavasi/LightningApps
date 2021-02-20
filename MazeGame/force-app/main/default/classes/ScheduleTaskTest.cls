global class ScheduleTaskTest implements Schedulable {
global void execute(SchedulableContext sc)
{
    System.debug('Schedulable Execute Started  TriggerId' +sc.getTriggerId());
        List<Account> UpdateAcntList=new List<Account>();
        For(Account acnt:[Select ID,Description from Account]){
            acnt.Description='Updated By Schedule Job ID';
             UpdateAcntList.add(acnt);              
        		}
        update UpdateAcntList;
}
}