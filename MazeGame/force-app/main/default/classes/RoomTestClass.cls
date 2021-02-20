@isTest
public with sharing class RoomTestClass {
   /* @testsetup
    private static void testData(){
        
        Hotel__C NewHotel= New Hotel__C();
            NewHotel.Name__c='TestHotel';
        insert NewHotel;
        List<Room__c> RoomsList=new List<Room__c>();
        For(integer i=1;i<10;i++)
        {
        Room__c NewRoom=New Room__c();
                NewRoom.Tarieff__c=250*i;
        NewRoom.Hotel__c=NewHotel.ID;
            RoomsList.add(NewRoom);
            }
        Insert RoomsList;
    }
     @isTest

    private static void UpdateTest()        
    {    
        Hotel__c Hotel=[Select ID from Hotel__c where Name__C='TestHotel' Limit 1];
        Room__c UpdateRoom= [Select Name from Room__c where Hotel__c=:Hotel.ID and  Tarieff__c=250] ;
       UpdateRoom.Tarieff__c=40000;
       // System.debug('UpdateRoom'+ UpdateRoom.size());
       update UpdateRoom;
        delete UpdateRoom;
    
    }*/
    @istest
    private static void testdelete()
    {
         Hotel__C NewHotel1= New Hotel__C();
            NewHotel1.Name__c='TestHotel123';
        insert NewHotel1;
         Room__c NewRoom1=New Room__c();
                NewRoom1.Tarieff__c=2500;
        NewRoom1.Hotel__c=NewHotel1.ID;
        insert NewRoom1;
        
                NewRoom1.Tarieff__c=2200;
        update NewRoom1;
        delete NewRoom1;
          //Room__c[] RestoreRoom= [Select Name from Room__c where Hotel__c=:NewHotel1.ID and  Tarieff__c=2500 ALL ROWS] ;
          //  undelete NewRoom1;
      //  System.debug('RestoreRoom'+RestoreRoom);
    }
}