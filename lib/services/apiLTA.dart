//import 'dart:developer';

//import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter_application_2/models/constants.dart';
import 'package:flutter_application_2/models/carparkavailability.dart';

class APIServiceLTA {
  Future<List<Value>> fetch() async {
    List<Value> data = List.empty();
    bool isEmpty = false;
    int page = 0;
    do {
      var cpa = await getCPA(page);
      data = data + cpa.value;
      page++;
      if (cpa.value.isEmpty) {
        isEmpty = true;
      }
    } while (!isEmpty);

    return data;
  }

  Future<CarparkAvailability> getCPA(page) async {
    try {
      Map<String, String> headers = {
        "AccountKey": "3ggiDbX+SeugujKDSCTClw==",
      };
      var url = Uri.parse(ApiConstants.baseUrl +
          ApiConstants.endPoint +
          ApiConstants.skip +
          (page * ApiConstants.skipvalue).toString());
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        CarparkAvailability cpa = carparkAvailabilityFromJson(response.body);
        print("Everything worked fine");
        return cpa;
      } else {
        print("why so noob tho");
        return CarparkAvailability(odataMetadata: "NOT 200", value: []);
      }
    } catch (e) {
      print("Error occured");
      print(e);
      return CarparkAvailability(odataMetadata: "ERROR", value: []);
    }
  }
}
