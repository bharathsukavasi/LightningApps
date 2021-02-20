public class CollectionsTest {

    Public void TestList(){
        List<Integer> ListInt=new List<Integer>();
        List<string> ListString=new List<string>();        
        List<SObject> ListSobject=new List<SObject>();
        ListInt.Add(1);
        ListInt.Add(2);
        ListInt.Add(2);
        ListInt.Add(3);
        ListInt.Add(3);
        for (integer i=0; i<ListInt.Size()-1;i++)
        {
            System.debug('List Item Index: '+i+'- Value:'+ListInt[i]);
            
        }
        List<Integer> ls2 = new List<Integer>(ListInt);
         
System.debug('Second List Data '+ls2);

        
    }
     Public void TestSet(){
            /*    Set<Integer> SetInt=new Set<Integer>();
        SetInt.Add(1);
        SetInt.Add(2);
        SetInt.Add(2);
        SetInt.Add(3);
        SetInt.Add(3);
         System.debug('First Set Data'+SetInt);
*/

    }
     Public void TestMap(){
        
    }
}