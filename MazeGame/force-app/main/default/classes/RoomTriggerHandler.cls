public with sharing class RoomTriggerHandler{
private boolean m_isExecuting=false;
private integer m_Size=0;
public Set<Id> HotelDs=new Set<Id>();
public List<Hotel__c> UpdatedHotelList=New List<Hotel__c>();

/*
trigger RoomsTrigger on Room__c (After Insert,After Update,After Delete, After Undelete) {
Set<Id> HotelDs=new Set<Id>();
List<Hotel__c> UpdatedHotelList=New List<Hotel__c>();
If(!Trigger.isdelete){
//Load all IDs from New except deletion operation
for(Room__c VarRoom:Trigger.New){
HotelDs.Add(VarRoom.Hotel__c);
}}
If(!Trigger.isInsert && Trigger.operationType<>TriggerOperation.AFTER_update){
//Load all IDs from Old Map
for(Room__c VarRoom:Trigger.old){
HotelDs.Add(VarRoom.Hotel__c);
}}
If(HotelDs.size()>0){
for(AggregateResult ar : [Select Hotel__c HtlID,count(ID) roomsCount from Room__c where Hotel__c  in :HotelDs group by Hotel__c ]){
Hotel__c  UpdateHotel=New Hotel__c ();
UpdateHotel.Id=(ID)ar.get('HtlID');
UpdateHotel.TotalNoOfRooms__c=(Integer)ar.get('roomsCount');
UpdatedHotelList.Add(UpdateHotel);
}
update UpdatedHotelList;
}

}


public RoomTriggerHandler(boolean isExecuting, integer Size)
{
m_isExecuting=isExecuting;
m_Size=Size;
}
*/

public void onBeforeInsert(List<Room__c> NewRoom)
{
System.debug('Trigger onBeforeInsert fired List:' +NewRoom );

}
public void onAfterInsert(List<Room__c> NewRoom,Map<ID,Room__c> NewRoomMap)
{
//Load all IDs from Old Map
for(Room__c VarRoom:NewRoom){
HotelDs.Add(VarRoom.Hotel__c);
}
UpdateList();
}
public void onBeforeUpdate(List<Room__c> NewRoom,Map<ID,Room__c> NewRoomMap,List<Room__c> OldRoom,Map<ID,Room__c> OldRoomMap)
{
System.debug('Trigger onBeforeUpdate fired New List:' +NewRoom );
System.debug('Trigger onBeforeUpdate fired New Map:' +NewRoomMap );
System.debug('Trigger onBeforeUpdate fired Old List:' +OldRoom);
System.debug('Trigger onBeforeUpdate fired Old Map:' +OldRoomMap );
}

public void onAfterUpdate(List<Room__c> NewRoom,Map<ID,Room__c> NewRoomMap,List<Room__c> OldRoom,Map<ID,Room__c> OldRoomMap)
{
//Load all IDs from Old Map
for(Room__c VarRoom:NewRoom){
HotelDs.Add(VarRoom.Hotel__c);
}
UpdateList();
}

public void onBeforeDelete(List<Room__c> oldRoom,Map<ID,Room__c> oldRoomMap)
{
}


public void onAfterDelete(List<Room__c> oldRoom,Map<ID,Room__c> oldRoomMap)
{
System.debug('Trigger onAfterDelete fired List:' +oldRoom);
System.debug('Trigger onAfterDelete fired Map:' +oldRoomMap);

//Load all IDs from New except deletion operation
for(Room__c VarRoom:oldRoom){
HotelDs.Add(VarRoom.Hotel__c);
}
UpdateList();

}


public void onAfterUndelete(List<Room__c> NewRoom,Map<ID,Room__c> NewRoomMap)
{

for(Room__c VarRoom:NewRoom){
HotelDs.Add(VarRoom.Hotel__c);
}
UpdateList();
}

private void UpdateList(){

If(HotelDs.size()>0){
for(AggregateResult ar : [Select Hotel__c HtlID,count(ID) roomsCount from Room__c where Hotel__c  in :HotelDs group by Hotel__c ]){
Hotel__c  UpdateHotel=New Hotel__c ();
UpdateHotel.Id=(ID)ar.get('HtlID');
UpdateHotel.TotalNoOfRooms__c=(Integer)ar.get('roomsCount');
UpdatedHotelList.Add(UpdateHotel);
}
update UpdatedHotelList;
}
}
}