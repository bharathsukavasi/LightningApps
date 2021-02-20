@isTest
public class Test_BeerSearchAuraService {

    private static testMethod void TestsearchBeers()
    {
        List<Beer__c> BeersData=BeerSearchAuraService.searchBeers('a');

    }
    
    private static testMethod void TestsearchBeers2()
    {
        String temp=null;
                List<Beer__c> BeersDataNull=BeerSearchAuraService.searchBeers(temp);

    }
}