public class MathOperations {
    public Integer avalue{get;set;}
    public Integer bvalue{get;set;}
    public Integer result{get;set;}
    public String operation{get;set;}
    
    public PageReference Addition()
    {
        result=avalue+bvalue;
        operation='SUBTRACTION';
        return null;
    }
}