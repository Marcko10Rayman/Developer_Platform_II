public with sharing class calloutInterview {

    public static String respStr = '';


    public calloutInterview() {

    }

    @AuraEnabled
    public static string getAnimals() {
        Final Http httpTst = new Http();
        Final HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        try {
            Final HttpResponse response = httpTst.send(request);
            if(response.getstatusCode() == 200) {
                Final Map<String,Object> getResp = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
                System.debug(getResp);
                respStr = String.valueOf(getResp.get('animals'));
                System.debug(respStr);
            }
        } catch(System.calloutException e) {
            System.debug('Error : ' + e);
        }
        return respStr;
    }

}