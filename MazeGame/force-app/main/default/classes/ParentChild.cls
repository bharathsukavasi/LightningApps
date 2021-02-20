public class ParentChild {
    public List<Account> acc{get;set;}
    public PageReference Show(){
        acc=[select Name,Industry,(Select AssistantName,Email from Contacts) from Account];
        return null;
    }
}