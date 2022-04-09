import 'package:flutter_application_2/Database/carparkDetail.dart';
import 'package:flutter_application_2/services/APIs.dart';

/// this is a controller class created for the purpose of initializing carpark objects in main
/// this connects the main and the API Service for extracting carparks

///initialize car park objects using API retrieved data and return a list of carpark objects
Future<List<CarparkDetail>> initCP() async {
  List<CarparkDetail> carparkObjects = <CarparkDetail>[];
  final api = APIServiceCP();
  final data = await api.fetch();

  for (int i = 0; i < data.length; i++) {
    carparkObjects.add(CarparkDetail(
        data[i].id.toString(),
        data[i].address,
        data[i].carParkBasement,
        data[i].carParkDecks,
        data[i].carParkNo,
        data[i].carParkType,
        data[i].freeParking,
        data[i].gantryHeight,
        data[i].nightParking,
        data[i].shortTermParking,
        data[i].typeOfParkingSystem,
        data[i].xCoord,
        data[i].yCoord));
  }

  return carparkObjects;
}
