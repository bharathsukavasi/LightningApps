public class PicklistExp1 {
    public selectOption[] myOption{set;get;}
    public PicklistExp1(){
        selectOption op1=new selectOption('One','Jan');
        selectOption op2=new selectOption('two','Feb');
        selectOption op3=new selectOption('three','March');
        selectOption op4=new selectOption('null','-None');
        myoption=new selectOption[]{op4,op3,op2,op1};
    }
}