public  class SalesTerritorySchedule implements Schedulable {
    public void execute(SchedulableContext ctx) {
        SalesTerritoryBatch Territorybatch = new SalesTerritoryBatch();
        database.executebatch(Territorybatch);       
    }
}