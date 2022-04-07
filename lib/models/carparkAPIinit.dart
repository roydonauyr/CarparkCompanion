import 'package:flutter_application_2/Database/carparkDetail.dart';
import 'package:flutter_application_2/services/APIs.dart';

Future<List<CarparkDetail>> initCP() async {
  List<CarparkDetail> carparkObjects = <CarparkDetail>[];
  final api = APIServiceCP();
  final data = await api.fetch();

  for (int i = 0; i < data.length; i += 20) {
    carparkObjects.add(carparkDetail(
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
