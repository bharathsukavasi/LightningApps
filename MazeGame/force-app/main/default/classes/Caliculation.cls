public class Caliculation {
//Variable declaration
    public Integer VarAvalue{get;set;}
    public Integer VarBvalue{get;set;}
    public Integer VarResult{get;set;}
    public String VarOperation{get;set;}
            
    //Perform Addition
    public PageReference Sum(){
        VarResult=VarAvalue+VarBvalue;
        VarOperation='ADDITION';
        return null;
    }
    public PageReference Sub(){
        VarResult=VarAvalue-VarBvalue;
        VarOperation='SUBTRACTION';
        return null;
    }
}