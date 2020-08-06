public class AnimalLocator {
    public static  String getAnimalNameById(Integer Id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String strResp = '';
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/:'+ Id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        System.debug('STATUS CODE : '+response.getStatusCode());
        System.debug('response Body : '+response.getBody());

        if (response.getStatusCode() == 200) {
             Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
          System.debug('results'+results);
            // Cast the values in the 'animals' key as a list
           Map<string,object> animals = (map<string,object>) results.get('animal');
           System.debug('Received the following animals:' + animals );
           strResp = string.valueof(animals.get('name'));
           System.debug('strResp >>>>>>' + strResp );
        }
        return strResp ;
        }
    
}