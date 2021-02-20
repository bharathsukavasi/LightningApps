public class ConstructorSample {
 public String Name;
   /* public ConstructorSample(){
        Name='Om Sai Ram';
    }*/
    public String getName(){
        return Name;
    }
    public void setName(String Name){
        this.Name=Name;
    }
    
    public void ChangeName(){
        this.Name='Name Changed';
    }
        
}