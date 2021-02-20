public class SoqlExample3 {
    public List<Account> accs {set;get;}
    public String accName {set;get;}
    public String accIndustry {set;get;}
    public void search(){
        accs=[select name,industry from Account where name=:accName and industry=:accIndustry];
    }
}