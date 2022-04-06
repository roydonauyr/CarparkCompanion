//import 'dart:developer';

//import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter_application_2/models/constants.dart';
import 'package:flutter_application_2/models/carpark.dart';
import 'package:flutter_application_2/models/dgcarparkavailability.dart';
import 'package:flutter_application_2/models/ltacarparkavailability.dart';

class APIServiceLTA {
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
        //print("Everything worked fine");
        return cpa;
      } else {
        //print("why so noob tho");
        return LTACarparkAvailability(odataMetadata: "NOT 200", value: []);
      }
    } catch (e) {
      //print("Error occured");
      print(e);
      return LTACarparkAvailability(odataMetadata: "ERROR", value: []);
    }
  }
}

class APIServiceDG {
  Future<List<CarparkDatum>> fetch() async {
    List<CarparkDatum> data = List.empty();

    var cpa = await DGgetCPA();
    data = data + cpa.items[0].carparkData;
    return data;
  }

  Future<DGCarparkAvailability> DGgetCPA() async {
    try {
      var url = Uri.parse(ApiConstantsDG.baseUrl + ApiConstantsDG.endPoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        DGCarparkAvailability cpa =
            dgCarparkAvailabilityFromJson(response.body);
        //print("Everything worked fine");
        return cpa;
      } else {
        //print("why so noob tho");
        return DGCarparkAvailability(items: []);
      }
    } catch (e) {
      //print("Error occured");
      print(e);
      return DGCarparkAvailability(items: []);
    }
  }
}

class APIServiceCP {
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

  Future<Carpark> getCarparks(page) async {
    try {
      var url = Uri.parse(ApiConstantsCP.baseUrl +
          ApiConstantsCP.endPoint +
          ApiConstantsCP.offset +
          (page * ApiConstantsCP.offsetvalue).toString());
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Carpark cp = carparkFromJson(response.body);
        print("Everything worked fine");
        return cp;
      } else {
        print("why so noob tho");
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
      print("Error occured");
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
