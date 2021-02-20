public class ListSelect {
    public String myval{get;set;}
    public List<SelectOption> myoptions;
    public List<SelectOption> getmyoptions(){
        return myoptions;
    }
    
    public ListSelect(){
    myoptions=new List<SelectOption>();
    SelectOption s=new SelectOption('Null','-None');
    SelectOption s1=new SelectOption('one','Jan'); 
    myoptions.add(s);
    myoptions.add(s1);
    }
}