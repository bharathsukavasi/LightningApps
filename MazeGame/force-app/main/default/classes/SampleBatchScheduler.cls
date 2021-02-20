global class SampleBatchScheduler implements Schedulable {
    
    // Execute at regular intervals
    global void execute(SchedulableContext ctx){
      SalesTerritoryBatch batch = new SalesTerritoryBatch();
      Database.executebatch(batch, 200);
    }
}