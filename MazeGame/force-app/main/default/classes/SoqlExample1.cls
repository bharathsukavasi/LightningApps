public class SoqlExample1 {
    public List<Account> accs{set;get;}
    public SoqlExample1(){
        accs=[Select id,name,industry,isdeleted from Account];
    }
    public void getOffset(){
         accs=[Select id,name,industry from Account offset 5];
    }
    public void getLimmit(){
        accs=[Select id,name,industry from Account limit 3];
    }
    public void getAllData(){
        accs=[Select id,name,industry,isdeleted from Account All Rows];
    }
    }