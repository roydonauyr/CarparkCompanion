// To parse this JSON data, do
//
//     final carparkAvailability = carparkAvailabilityFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

LTACarparkAvailability ltaCarparkAvailabilityFromJson(String str) =>
    LTACarparkAvailability.fromJson(json.decode(str));

String ltaCarparkAvailabilityToJson(LTACarparkAvailability data) =>
    json.encode(data.toJson());

class LTACarparkAvailability {
  LTACarparkAvailability({
    required this.odataMetadata,
    required this.value,
  });

  String odataMetadata;
  List<Value> value;

  factory LTACarparkAvailability.fromJson(Map<String, dynamic> json) =>
      LTACarparkAvailability(
        odataMetadata: json["odata.metadata"],
        value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "odata.metadata": odataMetadata,
        "value": List<dynamic>.from(value.map((x) => x.toJson())),
      };
}

class Value {
  Value({
    required this.carParkId,
    required this.area,
    required this.development,
    required this.location,
    required this.availableLots,
    required this.lotType,
    required this.agency,
  });

  String carParkId;
  String area;
  String development;
  String location;
  int availableLots;
  String lotType;
  String agency;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        carParkId: json["CarParkID"],
        area: json["Area"],
        development: json["Development"],
        location: json["Location"],
        availableLots: json["AvailableLots"],
        lotType: json["LotType"],
        agency: json["Agency"],
      );

  Map<String, dynamic> toJson() => {
        "CarParkID": carParkId,
        "Area": area,
        "Development": development,
        "Location": location,
        "AvailableLots": availableLots,
        "LotType": lotType,
        "Agency": agency,
      };
}
