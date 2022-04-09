import 'dart:convert';

/// this class was created to model the JSON data returned by Data.Gov API for Carpark Information

/// converts JSON data into carpark class object
Carpark carparkFromJson(String str) => Carpark.fromJson(json.decode(str));

/// converts carpark data into JSON data format
String carparkToJson(Carpark data) => json.encode(data.toJson());

/// carpark class data model as extracted from data.gov - this will later be processed into CarparkDetails objects
class Carpark {
  Carpark({
    required this.help,
    required this.success,
    required this.result,
  });

  String help;
  bool success;
  Result result;

/// help is the fetch message
/// success refers to the fetch state (pass/fail?); 
/// result contains the actual carpark data
  factory Carpark.fromJson(Map<String, dynamic> json) => Carpark(
        help: json["help"],
        success: json["success"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "help": help,
        "success": success,
        "result": result.toJson(),
      };
}

/// Result stores metadata; the actual carpark data is found in 'records'
class Result {
  Result({
    required this.resourceId,
    required this.fields,
    required this.records,
    required this.links,
    required this.offset,
    required this.total,
  });

/// aside from 'records', everything is just metadata - i.e. fetch information
  String resourceId;
  List<Field> fields;
  List<Record> records;
  Links links;
  int offset;
  int total;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        resourceId: json["resource_id"],
        fields: List<Field>.from(json["fields"].map((x) => Field.fromJson(x))),
        records:
            List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
        links: Links.fromJson(json["_links"]),
        offset: json["offset"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "resource_id": resourceId,
        "fields": List<dynamic>.from(fields.map((x) => x.toJson())),
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
        "_links": links.toJson(),
        "offset": offset,
        "total": total,
      };
}

class Field {
  Field({
    required this.type,
    required this.id,
  });

  String type;
  String id;

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        type: json["type"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
      };
}

class Links {
  Links({
    required this.start,
    required this.next,
  });

  String start;
  String next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        start: json["start"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "start": start,
        "next": next,
      };
}

/// Carpark information to be extracted stored in this part of the JSON format
class Record {
  Record({
    required this.shortTermParking,
    required this.carParkType,
    required this.yCoord,
    required this.xCoord,
    required this.freeParking,
    required this.gantryHeight,
    required this.carParkBasement,
    required this.nightParking,
    required this.address,
    required this.carParkDecks,
    required this.id,
    required this.carParkNo,
    required this.typeOfParkingSystem,
  });

  String shortTermParking;
  String carParkType;
  double yCoord;
  double xCoord;
  String freeParking;
  String gantryHeight;
  String carParkBasement;
  String nightParking;
  String address;
  String carParkDecks;
  int id;
  String carParkNo;
  String typeOfParkingSystem;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        shortTermParking: json["short_term_parking"],
        carParkType: json["car_park_type"],
        yCoord: double.parse(json["y_coord"]),
        xCoord: double.parse(json["x_coord"]),
        freeParking: json["free_parking"],
        gantryHeight: json["gantry_height"],
        carParkBasement: json["car_park_basement"],
        nightParking: json["night_parking"],
        address: json["address"],
        carParkDecks: json["car_park_decks"],
        id: json["_id"],
        carParkNo: json["car_park_no"],
        typeOfParkingSystem: json["type_of_parking_system"],
      );

  Map<String, dynamic> toJson() => {
        "short_term_parking": shortTermParking,
        "car_park_type": carParkType,
        "y_coord": yCoord,
        "x_coord": xCoord,
        "free_parking": freeParking,
        "gantry_height": gantryHeight,
        "car_park_basement": carParkBasement,
        "night_parking": nightParking,
        "address": address,
        "car_park_decks": carParkDecks,
        "_id": id,
        "car_park_no": carParkNo,
        "type_of_parking_system": typeOfParkingSystem,
      };
}
