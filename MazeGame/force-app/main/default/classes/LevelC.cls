public virtual class LevelC extends LevelB
{
public LevelC()
{
System.debug('This is LevelC Constructor');
}
public override void testMetod()
{
System.debug('This is TestC override');
}

public void testMetodC()
{
System.debug('This is TestC virtual ');
}
}