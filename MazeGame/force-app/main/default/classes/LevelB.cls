public virtual class LevelB extends LevelA
{
public LevelB()
{
System.debug('This is LevelB Constructor');
}
public virtual override void testMetod()
{
System.debug('This is TestB override');
}

public virtual void testMetodB()
{
System.debug('This is TestB virtual ');
}
}