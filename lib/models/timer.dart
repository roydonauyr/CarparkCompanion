import 'dart:async';
import 'package:flutter_application_2/services/APIs.dart';
import 'package:flutter_application_2/Database/carparkDetail.dart';

/// timer class acts as the boundary class
/// to periodically refresh API calls to update dynamic information like carpark vacancies

/// refreshes API calls to LTA every 60 seconds: inactive
/// to be triggered when API calls to data.gov fail
Timer refreshLTA(List<CarparkDetail> carparkObjects) {
  final APItimer = Timer.periodic(
    const Duration(seconds: 60),
    (timer) async {
      updateLTA(carparkObjects);
    },
  );
  return APItimer;
}

/// refreshes API calls to data.gov every 60 seconds: active
/// currently in use by the Application
/// on active standby for when firebase is slow/does not work
Timer refreshDG(List<CarparkDetail> carparkObjects) {
  final APItimer = Timer.periodic(
    const Duration(seconds: 60),
    (timer) async {
      updateDG(carparkObjects);
    },
  );
  return APItimer;
}

/// a single ad-hoc call to update carpark vacancies of existing carpark objects using LTA's API
void updateLTA(carparkObjects) async {
  final api = APIServiceLTA();
  final data = await api.fetch();
  for (int i = 0; i < carparkObjects.length; i++) {
    String id = carparkObjects[i].carpark_no;
    for (int d = 0; d < data.length; d++) {
      if (data[d].carParkId == id) {
        carparkObjects[i].vacancy = data[d].availableLots;
        break;
      }
    }
  }
}

/// a single ad-hoc call to update carpark vacancies of existing carpark objects using data.gov's API
void updateDG(carparkObjects) async {
  final api = APIServiceDG();

  final data = await api.fetch();
  for (int i = 0; i < carparkObjects.length; i++) {

    String id = carparkObjects[i].carpark_no;
    for (int d = 0; d < data.length; d++) {
      if (data[d].carparkNumber == id) {
        carparkObjects[i].vacancy = data[d].carparkInfo[0].lotsAvailable;
        break;
      }
    }
  }
}
