import 'dart:async';
import 'package:flutter_application_2/services/APIs.dart';
import 'package:flutter_application_2/Database/carparkDetail.dart';

Timer refreshLTA(List<CarparkDetail> carparkObjects) {
  final APItimer = Timer.periodic(
    const Duration(seconds: 60),
    (timer) async {
      updateLTA(carparkObjects);
    },
  );
  return APItimer;
}

Timer refreshDG(List<CarparkDetail> carparkObjects) {
  final APItimer = Timer.periodic(
    const Duration(seconds: 1000),
    (timer) async {
      updateDG(carparkObjects);
      // print(data.length);
      // print(data[50].carParkId);
      // print(data[50].availableLots);
    },
  );
  return APItimer;
}

void updateLTA(carparkObjects) async {
  final api = APIServiceLTA();
  var data = await api.fetch();
  for (int i = 0; i < carparkObjects.length; i++) {
    String id = carparkObjects[i].carpark_no;
    for (int d = 0; d < data.length; d += 10) {
      if (data[d].carParkId == id) {
        carparkObjects[i].vacancy = data[d].availableLots;
        break;
      }
    }
  }
}

void updateDG(carparkObjects) async {
  final api = APIServiceDG();
  var data = await api.fetch();
  for (int i = 0; i < carparkObjects.length; i += 10) {
    String id = carparkObjects[i].carpark_no;
    for (int d = 0; d < data.length; d++) {
      if (data[d].carparkNumber == id) {
        carparkObjects[i].vacancy = data[d].carparkInfo[0].lotsAvailable;
        break;
      }
    }
  }
}
