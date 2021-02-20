@RestResource(urlMapping='/opportunities/*')
global with sharing class OpportunityManager {
@HttpGet
    global static Opportunity getOpportunityByID()
    {
     RestRequest request=RestContext.request;
        String oppId=request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Opportunity result=[SELECT Name, StageName, LeadSource, CloseDate, Probability FROM Opportunity where ID= :oppId] ;
        return result;
            
        
    }
    @HttpDelete
     global static string deleteOpportunityByID()
    {
     RestRequest request=RestContext.request;
        String oppId=request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Opportunity result=[SELECT Name, StageName, LeadSource, CloseDate, Probability FROM Opportunity where ID= :oppId] ;
      string VarResult= 'Success';
          delete result;
            return VarResult;
        
    }
 @HttpPost
     global static ID CreateOpportunity(string sId, string Name,string stage, string closedate, string source)
    {
        Opportunity NewOpportunity= new Opportunity(
      		Id=sId,
            name=Name,
            stageName=stage,
            leadSource=source,
            closedate=Date.valueOf(closedate));
            upsert NewOpportunity;
        return NewOpportunity.Id;
        
    }
    //@HttpPut
     global static ID CreateUpdateOpportunity(string Name,string stage, string closedate, string source)
    {
         RestRequest request=RestContext.request;
        String oppId=request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
     
        Opportunity NewOpportunity= new Opportunity(
            name=Name,
            stageName=stage,
            leadSource=source,
            closedate=Date.valueOf(closedate));
        If(string.isNotEmpty(oppId)){
            NewOpportunity.Id=oppId;
        }
            upsert NewOpportunity;
        return NewOpportunity.Id;
        
    }
}