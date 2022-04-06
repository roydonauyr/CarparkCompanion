import 'dart:async';
//import 'package:async/async.dart';
import 'package:flutter_application_2/services/APIs.dart';
import 'package:flutter_application_2/Database/carparkDetail.dart';

Timer refreshLTA(List<carparkDetail> carparkObjects) {
  final APItimer = Timer.periodic(
    const Duration(seconds: 60),
    (timer) async {
      updateLTA(carparkObjects);
      // print(data.length);
      // print(data[50].carParkId);
      // print(data[50].availableLots);
    },
  );
  return APItimer;
}

Timer refreshDG(List<carparkDetail> carparkObjects) {
  final APItimer = Timer.periodic(
    const Duration(seconds: 60),
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
    for (int d = 0; d < data.length; d++) {
      if (data[d].carParkId == id) {
        print("HELLO I FOUND CARPARK ID: " + id);
        carparkObjects[i].vacancy = data[d].availableLots;
        break;
      }
    }
  }
}

void updateDG(carparkObjects) async {
  final api = APIServiceDG();
  var data = await api.fetch();
  for (int i = 0; i < carparkObjects.length; i++) {
    String id = carparkObjects[i].carpark_no;
    for (int d = 0; d < data.length; d++) {
      if (data[d].carparkNumber == id) {
        print("HELLO I FOUND CARPARK ID: " + id);
        carparkObjects[i].vacancy = data[d].carparkInfo[0].lotsAvailable;
        break;
      }
    }
  }
}

// to stop timer:
// use APItimer.cancel();
