public class ContactController {
    @AuraEnabled
    public static List<contact> allContact(){
        return [select id,name,phone from contact limit 10];
}
    @AuraEnabled
    public static List<contact> searchByName(String searchName){
        String name='%'+searchName+'%';
        return [select id,name,phone from Contact where phone != null AND name like:name];
       
    }
     @AuraEnabled
    public static Contact findById(String contactId) {
        return [SELECT id, name, title, phone, mobilephone, Account.Name
                    FROM Contact WHERE Id = :contactId];
    }
}