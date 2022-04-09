// To parse this JSON data, do
//
//     final carparkAvailability = carparkAvailabilityFromJson(jsonString);

/// this class file models the Carpark Availability JSON data provided by LTA DATA MALL

// import 'package:meta/meta.dart';
import 'dart:convert';

/// Convert data.gov JSON into a dart object class equivalent
LTACarparkAvailability ltaCarparkAvailabilityFromJson(String str) =>
    LTACarparkAvailability.fromJson(json.decode(str));

/// Converts dart object: carparkavailability into JSON format
String ltaCarparkAvailabilityToJson(LTACarparkAvailability data) =>
    json.encode(data.toJson());

/// contains metavalue and actual data under 'value' object
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

/// desired carpark availability data found here
/// other information not utilized but extracted to follow JSON response format
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
