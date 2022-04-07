import 'package:flutter_application_2/Database/carparkDetail.dart';
import 'package:flutter_application_2/services/APIs.dart';

Future<List<CarparkDetail>> initCP() async {
  List<CarparkDetail> carparkObjects = <CarparkDetail>[];
  final api = APIServiceCP();
  var data = await api.fetch();

  for (int i = 1; i < 5; i++) {
    String id = data[i].id.toString();
    String address = data[i].address;
    String carpark_basement = data[i].carParkBasement;
    String carpark_decks = data[i].carParkDecks;
    String carpark_no = data[i].carParkNo;
    String carpark_type = data[i].carParkType;
    String free_parking = data[i].freeParking;
    String gantry_height = data[i].gantryHeight;
    String night_parking = data[i].nightParking;
    String short_term_parking = data[i].shortTermParking;
    String type_of_parking_system = data[i].typeOfParkingSystem;
    double x_cord = data[i].xCoord;
    double y_cord = data[i].yCoord;
    carparkObjects.add(CarparkDetail(
        id,
        address,
        carpark_basement,
        carpark_decks,
        carpark_no,
        carpark_type,
        free_parking,
        gantry_height,
        night_parking,
        short_term_parking,
        type_of_parking_system,
        x_cord,
        y_cord));
  }

  return carparkObjects;
}
