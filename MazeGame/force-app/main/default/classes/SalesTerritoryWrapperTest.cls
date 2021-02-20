@IsTest
public class SalesTerritoryWrapperTest {
   	
	static testMethod void testParse() {
		String json = '{'+
		'    \"dataOut\": {'+
		'        \"SalesTerritory\": ['+
		'            {'+
		'                \"ErpID\": \"YMRD01-BRAZ1\",'+
		'                \"TerritoryID\": \"BRAZ1\",'+
		'                \"TerritoryDesc\": \"Brazil 1: Lima\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-BRAZ2\",'+
		'                \"TerritoryID\": \"BRAZ2\",'+
		'                \"TerritoryDesc\": \"Brazil 2: Freitas\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-BRAZ3\",'+
		'                \"TerritoryID\": \"BRAZ3\",'+
		'                \"TerritoryDesc\": \"Brazil 3: Pinto\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-BRAZ4\",'+
		'                \"TerritoryID\": \"BRAZ4\",'+
		'                \"TerritoryDesc\": \"Brazil 4: Gomes\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-BRAZ5\",'+
		'                \"TerritoryID\": \"BRAZ5\",'+
		'                \"TerritoryDesc\": \"Brazil 5:  Borsato\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-CAN1\",'+
		'                \"TerritoryID\": \"CAN1\",'+
		'                \"TerritoryDesc\": \"Canada 1: Jacobs\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-CAN2\",'+
		'                \"TerritoryID\": \"CAN2\",'+
		'                \"TerritoryDesc\": \"Canada 2: Mori\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-CAN3\",'+
		'                \"TerritoryID\": \"CAN3\",'+
		'                \"TerritoryDesc\": \"Canada 3: Spooner\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-CAN4\",'+
		'                \"TerritoryID\": \"CAN4\",'+
		'                \"TerritoryDesc\": \"Canada 4: Gore\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-CPG1\",'+
		'                \"TerritoryID\": \"CPG1\",'+
		'                \"TerritoryDesc\": \"Consumer Package Goods:  Uhl\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-CPG3\",'+
		'                \"TerritoryID\": \"CPG3\",'+
		'                \"TerritoryDesc\": \"Consumer Package Goods: Costa\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-CPG2\",'+
		'                \"TerritoryID\": \"CPG2\",'+
		'                \"TerritoryDesc\": \"Consumer Package Goods: Holmes\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-EAST1\",'+
		'                \"TerritoryID\": \"EAST1\",'+
		'                \"TerritoryDesc\": \"East 1:  Egeland\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-EAST2\",'+
		'                \"TerritoryID\": \"EAST2\",'+
		'                \"TerritoryDesc\": \"East 2: Moloney\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-EAST3\",'+
		'                \"TerritoryID\": \"EAST3\",'+
		'                \"TerritoryDesc\": \"East 3: Ferrell\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-EAST4\",'+
		'                \"TerritoryID\": \"EAST4\",'+
		'                \"TerritoryDesc\": \"East 4: Lamantia\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-EAST5\",'+
		'                \"TerritoryID\": \"EAST5\",'+
		'                \"TerritoryDesc\": \"East 5: Larussa\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-EAST6\",'+
		'                \"TerritoryID\": \"EAST6\",'+
		'                \"TerritoryDesc\": \"East 6: Gamble\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-EAST7\",'+
		'                \"TerritoryID\": \"EAST7\",'+
		'                \"TerritoryDesc\": \"East 7:  Foreman\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-EAST8\",'+
		'                \"TerritoryID\": \"EAST8\",'+
		'                \"TerritoryDesc\": \"East 8: Weinkamer\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-EDU1\",'+
		'                \"TerritoryID\": \"EDU1\",'+
		'                \"TerritoryDesc\": \"Education 1: Graff\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-GL1\",'+
		'                \"TerritoryID\": \"GL1\",'+
		'                \"TerritoryDesc\": \"Great Lakes 1:  Bowen\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-GL2\",'+
		'                \"TerritoryID\": \"GL2\",'+
		'                \"TerritoryDesc\": \"Great Lakes 2: Garvey\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-GL3\",'+
		'                \"TerritoryID\": \"GL3\",'+
		'                \"TerritoryDesc\": \"Great Lakes 3: Rowlee\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-GL4\",'+
		'                \"TerritoryID\": \"GL4\",'+
		'                \"TerritoryDesc\": \"Great Lakes 4: Morris\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-GL5\",'+
		'                \"TerritoryID\": \"GL5\",'+
		'                \"TerritoryDesc\": \"Great Lakes 5: Longenecker\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-GL6\",'+
		'                \"TerritoryID\": \"GL6\",'+
		'                \"TerritoryDesc\": \"Great Lakes 6: Hiatt\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-BRAZH\",'+
		'                \"TerritoryID\": \"BRAZH\",'+
		'                \"TerritoryDesc\": \"House Brazil\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-CANH\",'+
		'                \"TerritoryID\": \"CANH\",'+
		'                \"TerritoryDesc\": \"House Canada\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-EASTH\",'+
		'                \"TerritoryID\": \"EASTH\",'+
		'                \"TerritoryDesc\": \"House East\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-GLH\",'+
		'                \"TerritoryID\": \"GLH\",'+
		'                \"TerritoryDesc\": \"House Great Lakes\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-MEXH\",'+
		'                \"TerritoryID\": \"MEXH\",'+
		'                \"TerritoryDesc\": \"House Mexico\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-WESTH\",'+
		'                \"TerritoryID\": \"WESTH\",'+
		'                \"TerritoryDesc\": \"House West\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-INTLH\",'+
		'                \"TerritoryID\": \"INTLH\",'+
		'                \"TerritoryDesc\": \"International Direct\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-MEX1\",'+
		'                \"TerritoryID\": \"MEX1\",'+
		'                \"TerritoryDesc\": \"Mexico 1: Bernal\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-MEX2\",'+
		'                \"TerritoryID\": \"MEX2\",'+
		'                \"TerritoryDesc\": \"Mexico 2: Davila\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-MEX3\",'+
		'                \"TerritoryID\": \"MEX3\",'+
		'                \"TerritoryDesc\": \"Mexico 3: Bernal\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-MEX4\",'+
		'                \"TerritoryID\": \"MEX4\",'+
		'                \"TerritoryDesc\": \"Mexico 4: Feito\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-USH\",'+
		'                \"TerritoryID\": \"USH\",'+
		'                \"TerritoryDesc\": \"U.S. House Direct\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-WEST1\",'+
		'                \"TerritoryID\": \"WEST1\",'+
		'                \"TerritoryDesc\": \"West 1: Mendez\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-WEST2\",'+
		'                \"TerritoryID\": \"WEST2\",'+
		'                \"TerritoryDesc\": \"West 2: Howard\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-WEST3\",'+
		'                \"TerritoryID\": \"WEST3\",'+
		'                \"TerritoryDesc\": \"West 3: Rubenstein\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-WEST4\",'+
		'                \"TerritoryID\": \"WEST4\",'+
		'                \"TerritoryDesc\": \"West 4: Barker\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-WEST5\",'+
		'                \"TerritoryID\": \"WEST5\",'+
		'                \"TerritoryDesc\": \"West 5: Dorros\"'+
		'            },'+
		'            {'+
		'                \"ErpID\": \"YMRD01-WEST6\",'+
		'                \"TerritoryID\": \"WEST6\",'+
		'                \"TerritoryDesc\": \"West 6: Bollig\"'+
		'            }'+
		'        ]'+
		'    }'+
		'}';
		SalesTerritoryWrapper obj = SalesTerritoryWrapper.parse(json);
		System.assert(obj != null);
	}
}