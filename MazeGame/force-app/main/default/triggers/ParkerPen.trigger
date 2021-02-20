trigger ParkerPen on Parker_Pen__c (before insert) {


Parkerpen.apllayDiscount(Trigger.New);
}