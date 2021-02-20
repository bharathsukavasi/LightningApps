public class Pg1_Employee {
	String EmployeeName;
    Integer EmployeeNo;
             public pg1_Employee(){
        EmployeeName='SaiRam';
        EmployeeNo=786;
 		 }
     
    
    public Integer getEmployeeNo(){
        return EmployeeNo;
    }
    
    public String getEmployeeName(){
        return EmployeeName;
    }
    
    public void Show(){
        System.debug('Employee Name:'+EmployeeName);
        system.debug('Employee Number:'+EmployeeNo);
    }
}