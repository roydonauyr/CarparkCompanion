//import 'package:http/http.dart' as http;

class ApiConstantsLTA {
  static String baseUrl = 'http://datamall2.mytransport.sg/ltaodataservice';
  static String endPoint = '/CarParkAvailabilityv2';
  static String skip = '?\$skip=';
  static int skipvalue = 500;
}

class ApiConstantsDG {
  static String baseUrl = 'https://api.data.gov.sg/v1/transport';
  static String endPoint = '/carpark-availability';
}

class ApiConstantsCP {
  static String baseUrl = 'https://data.gov.sg/api/action';
  static String endPoint =
      '/datastore_search?resource_id=139a3035-e624-4f56-b63f-89ae28d4ae4c';
  static String offset = '&offset=';
  static int offsetvalue = 100;
}
