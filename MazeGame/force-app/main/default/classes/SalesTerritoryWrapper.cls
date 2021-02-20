public with sharing class SalesTerritoryWrapper {  
    
	public class SalesTerritory {
		public String ErpID;
		public String TerritoryID;
		public String TerritoryDesc;
	}

	public DataOut dataOut;

	public class DataOut {
		public List<SalesTerritory> SalesTerritory;
	}

	
	public static SalesTerritoryWrapper parse(String json) {
		return (SalesTerritoryWrapper) System.JSON.deserialize(json, SalesTerritoryWrapper.class);
	}
}