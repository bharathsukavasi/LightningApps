public class InsertContactApexClass {
	@AuraEnabled
    Public static contact createContact(String ParentAccountID, String FirstName, String LastName)
    {
        Contact con=New Contact();
        con.FirstName=FirstName;
        con.LastName=LastName;
        con.AccountId=ParentAccountID;
        Insert con;
        return con;
    }
}