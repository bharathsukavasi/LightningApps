public class FutureTaskTest {
 @future
    public static void TestFuture1()
    {
        System.debug('TestFuture1 Executed');
    }
     @future
    public static void TestFuture2()
    {
        System.debug('TestFuture2 Executed');
    }
     @future
    public static void TestFuture3()
    {
        System.debug('TestFuture3 Executed');
    }
public void ExecuteFuture()
{
    TestFuture2();
    TestFuture3();
    TestFuture1();
}    
}