import 'package:http/http.dart' as http;
import 'package:flutter_application_2/models/constants.dart';
import 'package:flutter_application_2/models/carpark.dart';
import 'package:flutter_application_2/models/dgcarparkavailability.dart';
import 'package:flutter_application_2/models/ltacarparkavailability.dart';

/// this dart file contains code for calling all API Services

/// creates an instance of a API Service class capable of fetching carpark availability data from LTA datamall
class APIServiceLTA {
  /// fetch handles loop logic to collect all pages relevant to perform a complete API fetch (i.e. whole API database)
  /// all pages are merged before being returned as usable results
  Future<List<Value>> fetch() async {
    List<Value> data = List.empty();
    bool isEmpty = false;
    int page = 0;
    do {
      var cpa = await LTAgetCPA(page);
      data = data + cpa.value;
      page++;
      if (cpa.value.isEmpty) {
        isEmpty = true;
      }
    } while (!isEmpty);

    return data;
  }

/// function to fetch API data from LTA datamall
/// fetched JSON data processed into CarparkAvailability dart data model
  Future<LTACarparkAvailability> LTAgetCPA(page) async {
    try {
      Map<String, String> headers = {
        "AccountKey": "3ggiDbX+SeugujKDSCTClw==",
      };
      var url = Uri.parse(ApiConstantsLTA.baseUrl +
          ApiConstantsLTA.endPoint +
          ApiConstantsLTA.skip +
          (page * ApiConstantsLTA.skipvalue).toString());
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        LTACarparkAvailability cpa =
            ltaCarparkAvailabilityFromJson(response.body);
        return cpa;
      } else {
        return LTACarparkAvailability(odataMetadata: "NOT 200", value: []);
      }
    } catch (e) {
      print(e);
      return LTACarparkAvailability(odataMetadata: "ERROR", value: []);
    }
  }
}

/// creates an instance of a API Service class capable of fetching carpark availability data from DATA.GOV
class APIServiceDG {

  // single fetch performed here as Data.Gov return all carpark vacancy data in a single pull
  Future<List<CarparkDatum>> fetch() async {

    var cpa = await DGgetCPA();
    print("[FETCHED:] " + cpa.items[0].carparkData.length.toString() + " Carpark Vacancies");
    return cpa.items[0].carparkData;
  }

/// function to fetch API data from DATA.GOV
/// fetched JSON data processed into CarparkAvailability dart data model
  Future<DGCarparkAvailability> DGgetCPA() async {
    try {
      var url = Uri.parse(ApiConstantsDG.baseUrl + ApiConstantsDG.endPoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        DGCarparkAvailability cpa =
            dgCarparkAvailabilityFromJson(response.body);
        print("RESPONSE [200] from DATA.GOV - Carpark Availability");
        return cpa;
      } else {
        print("RESPONSE [NOT 200] from DATA.GOV - something went wrong. empty carpark objects data returned");
        return DGCarparkAvailability(items: []);
      }
    } catch (e) {
      print("Caught Exception - returning empty carpark availability data");
      print(e);
      return DGCarparkAvailability(items: []);
    }
  }
}

/// creates an instance of a API Service class capable of fetching carpark information data from DATA.GOV
class APIServiceCP {

  /// fetch handles loop logic to collect all pages relevant to perform a complete API fetch (i.e. whole API database)
  /// all pages are merged before being returned as usable results
  Future<List<Record>> fetch() async {
    List<Record> data = List.empty();
    bool isEmpty = false;
    int page = 0;
    do {
      var cp = await getCarparks(page);
      data = data + cp.result.records;
      page++;
      if (cp.result.records.isEmpty) {
        isEmpty = true;
      }
    } while (!isEmpty);

    return data;
  }

/// function to fetch Carpark information API data from DATA.GOV
/// fetched JSON data processed into Carpark dart data model
  Future<Carpark> getCarparks(page) async {
    try {
      var url = Uri.parse(ApiConstantsCP.baseUrl +
          ApiConstantsCP.endPoint +
          ApiConstantsCP.offset +
          (page * ApiConstantsCP.offsetvalue).toString());
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Carpark cp = carparkFromJson(response.body);
        print("RESPONSE [200] from DATA.GOV - Carpark info data");
        return cp;
      } else {
        print("RESPONSE [NOT 200] from DATA.GOV - something went wrong. empty carpark objects data returned");
        // empty Carpark
        return Carpark(
            help: "NOT 200",
            success: false,
            result: Result(
                resourceId: "",
                fields: [],
                records: [],
                links: Links(start: "", next: ""),
                offset: 0,
                total: 0));
      }
    } catch (e) {
      print("Caught Exception - returning empty carpark objects data");
      print(e);
      return Carpark(
          help: "ERROR",
          success: false,
          result: Result(
              resourceId: "",
              fields: [],
              records: [],
              links: Links(start: "", next: ""),
              offset: 0,
              total: 0));
    }
  }
}
