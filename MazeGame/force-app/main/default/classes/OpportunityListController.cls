public class OpportunityListController {
@AuraEnabled
    public static List<Opportunity> fetchOpportunity(String searchKeyword)
    {
    List<Opportunity> returnList=new List<Opportunity>();
    String searchKey=String.isBlank(searchKeyword) ? '%%' : searchKeyword+ '%';
    returnList=[SELECT Id,    Name,    CloseDate from Opportunity WHERE Name LIKE :searchKey LIMIT 5];
    return returnList;
}
}