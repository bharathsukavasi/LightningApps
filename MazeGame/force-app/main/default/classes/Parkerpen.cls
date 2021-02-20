public class Parkerpen
{

public static void apllayDiscount(list<Parker_Pen__c> VarPinListNew)
{
for(Parker_Pen__c varPen:VarPinListNew)
{

varPen.Price__c =varPen.Price__c-(varPen.Price__c * 0.2);
}

}
}