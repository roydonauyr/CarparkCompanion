import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_2/Database/carparkDetail.dart';
import 'package:flutter_application_2/main.dart' as globals;
import 'package:flutter_application_2/screens/home/home.dart';
import 'package:flutter_application_2/screens/landingMap.dart';
import 'package:flutter_application_2/services/markersGenerator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// void() main() async {
//     await GetStorage.init;
//     runApp(globals.MyApp());
// }
class filter extends StatefulWidget {
  // final switchData = GetStorage();
  // bool isSwitched = false;
  // @override

  // void initState(){
  //   super.initState();

  // }
  static Map<String, List<String>> userFilters = {};
  static late Map<String, Map<String, bool>> switchesFilter = {
    'car_park_type': {
      'SURFACE CAR PARK': false,
      'MULTI-STOREY CAR PARK': false
    },
    'type_of_parking_system': {
      'ELECTRONIC PARKING': false,
      'COUPON PARKING': false
    },
    'night_parking': {'YES': false, 'NO': false},
    'free_parking': {'YES': false, 'NO': false},
    'short_term_parking': {'YES': false, 'NO': false}
  };
  @override
  State<StatefulWidget> createState() {
    return _filterState();
  }

  static Map<String, List<String>> returnFilters() {
    userFilters = _filterState.getFilters();
    return userFilters;
  }

  static GetSwitchesFilter() {
    return switchesFilter;
  }
}

class _filterState extends State<filter> {
  static Map<String, Map<String, bool>> switches = {
    'car_park_type': {
      'SURFACE CAR PARK': false,
      'MULTI-STOREY CAR PARK': false
    },
    'type_of_parking_system': {
      'ELECTRONIC PARKING': false,
      'COUPON PARKING': false
    },
    'night_parking': {'YES': false, 'NO': false},
    'free_parking': {'YES': false, 'NO': false},
    'short_term_parking': {'YES': false, 'NO': false}
  };

  static void setSwitchesFilter(Map<String, Map<String, bool>> s) {
    switches = s;
  }

  static void setSwitchesNull() {
    switches = {
      'car_park_type': {
        'SURFACE CAR PARK': false,
        'MULTI-STOREY CAR PARK': false
      },
      'type_of_parking_system': {
        'ELECTRONIC PARKING': false,
        'COUPON PARKING': false
      },
      'night_parking': {'YES': false, 'NO': false},
      'free_parking': {'YES': false, 'NO': false},
      'short_term_parking': {'YES': false, 'NO': false}
    };
  }

  static Map<String, List<String>> filters = {
    'car_park_type': [],
    'type_of_parking_system': [],
    'night_parking': [],
    'free_parking': [],
    'short_term_parking': []
  };
  Set<Marker> marked = new Set();

  static Map<String, List<String>> getFilters() {
    Map<String, List<String>> copy = filters;
    filters = {
      'car_park_type': [],
      'type_of_parking_system': [],
      'night_parking': [],
      'free_parking': [],
      'short_term_parking': []
    };
    return copy;
  }

// ValueNotifier<int> buttonClickedTimes =ValueNotifier(0);

  static List<carparkDetail> filterExecute(
      Map<String, List<String>> filters, List<carparkDetail> carparks) {
    List<carparkDetail> filtered1 = [];
    List<carparkDetail> filtered2 = carparks;

    for (int i = 0; i < filters.length; i++) {
      String key = filters.keys.elementAt(i); //Carpark Type , Parking

      List<String> value = filters.values.elementAt(i); //Open, Multi, Basement

      for (int j = 0; j < value.length; j++) {
        String name = value.elementAt(j); //Open OR Multi OR Basement

        for (int z = 0; z < filtered2.length; z++) {
          carparkDetail car = filtered2.elementAt(z); // 1 carpark detail object

          if (key == "car_park_type" && name == car.carpark_type) {
            filtered1.add(car);
          } else if (key == "type_of_parking_system" &&
              name == car.type_of_parking_system) {
            filtered1.add(car);
          } else if (key == "free_parking") {
            if (name == "NO" && name == car.free_parking) {
              filtered1.add(car);
            } else if (name == "YES" &&
                name != car.free_parking &&
                car.free_parking != "NO") {
              filtered1.add(car);
            }
          } else if (key == "night_parking" && name == car.night_parking) {
            filtered1.add(car);
          } else if (key == "short_term_parking") {
            if (name == "NO" && name == car.short_term_parking) {
              filtered1.add(car);
            } else if (name == "YES" &&
                name != car.short_term_parking &&
                car.short_term_parking != "NO") {
              filtered1.add(car);
            }
          }
        }
        filtered2 = filtered1;
        filtered1 = [];
      }
    }

    return filtered2;
  }

  //          ValueListenableBuilder(
  //   valueListenable: buttonClickedTimes,
  // builder: (BuildContext context, int counterValue,Widget child){
  //         return Text("Counter:$counterValue");

  @override
  Widget build(BuildContext context) {
    // final switchData = GetStorage();
    // bool isSwitched = false;
    setSwitchesFilter(landingMap.GetSwitchesMap());

    return Scaffold(
        appBar: AppBar(
          title: Text("Apply Filters"),
          backgroundColor: Color.fromARGB(255, 20, 27, 66),
          elevation: 0.0,
          actions: <Widget>[
            ElevatedButton.icon(
              icon: const Icon(Icons.add_circle_outlined),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 20, 27, 66),
              ),
              onPressed: () {
                //  if(switchData.read('isSwitched') != null){
                //   setState(() {
                //     isSwitched = switchData.read('isSwitched');
                //   });

                //  }

                for (int i = 0; i < switches.length; i++) {
                  String main_key = switches.keys.elementAt(i);
                  Map<String, bool> cur = switches.values.elementAt(i);
                  for (int j = 0; j < cur.length; j++) {
                    String key = cur.keys.elementAt(j);
                    if (cur.values.elementAt(j) == true) {
                      filters[main_key]?.add(key);
                      //print(filters);
                    }
                  }
                }
                globals.filterState = true;
                globals.markersFiltered.clear();
                Map<String, List<String>> filters2 = getFilters();
                List<carparkDetail> cars = globals.carparkObjects;
                List<carparkDetail> filtered = filterExecute(filters2, cars);

                for (carparkDetail objects in filtered) {
                  markersGenerator().generate_colored_markers(objects, context);
                }

                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              label: const Text('Apply'),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.remove_circle_outline),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 20, 27, 66),
              ),
              onPressed: () {
                globals.filterState = false;
                landingMap.setSwitchesNull();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              label: const Text('Clear'),
            )
          ],
        ),
        body: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Car Park Type",
                style: TextStyle(color: Colors.blue[700], fontSize: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Open Space only",
                style: TextStyle(fontSize: 15),
              ),
              Switch(
                value: switches['car_park_type']!['SURFACE CAR PARK']!,
                // value: true,
                onChanged: (value) {
                  setState(() {
                    switches['car_park_type']!['SURFACE CAR PARK'] =
                        !(switches['car_park_type']!['SURFACE CAR PARK']!);
                  });
                },
                activeColor: Colors.green,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Multi-Storey only",
                style: TextStyle(fontSize: 15),
              ),
              Switch(
                value: switches['car_park_type']!['MULTI-STOREY CAR PARK']!,
                // value: true,
                onChanged: (value) {
                  setState(() {
                    switches['car_park_type']!["MULTI-STOREY CAR PARK"] =
                        !(switches['car_park_type']!["MULTI-STOREY CAR PARK"]!);
                    // isSwitched = value;
                    // switchData.write('isSwitched',isSwitched);
                    //   // if(switchData.read('isSwitched') != null){
                    //  setState((){
                    //       isSwitched = switchData.read('isSwitched');
                    // });}
                  });
                  //   GestureDetector(
                  //   onTap:()=>buttonClickedTimes.value= buttonClickedTimes.value+1,
                  // child: Text("Button",style:Theme.of(context).textTheme.button)
                  // );
                },
                activeColor: Colors.green,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Parking System",
                style: TextStyle(color: Colors.blue[700], fontSize: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Electronic only",
                style: TextStyle(fontSize: 15),
              ),
              Switch(
                value:
                    switches['type_of_parking_system']!['ELECTRONIC PARKING']!,
                onChanged: (value) {
                  setState(() {
                    switches['type_of_parking_system']!['ELECTRONIC PARKING'] =
                        !(switches['type_of_parking_system']![
                            'ELECTRONIC PARKING']!);
                  });
                },
                activeColor: Colors.green,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Coupon only",
                style: TextStyle(fontSize: 15),
              ),
              Switch(
                value: switches['type_of_parking_system']!['COUPON PARKING']!,
                onChanged: (value) {
                  setState(() {
                    switches['type_of_parking_system']!['COUPON PARKING'] =
                        !(switches['type_of_parking_system']![
                            'COUPON PARKING']!);
                  });
                },
                activeColor: Colors.green,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Others",
                style: TextStyle(color: Colors.blue[700], fontSize: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Night Parking",
                style: TextStyle(fontSize: 15),
              ),
              Switch(
                value: switches['night_parking']!['YES']!,
                onChanged: (value) {
                  setState(() {
                    switches['night_parking']!['YES'] =
                        !(switches['night_parking']!['YES']!);
                  });
                },
                activeColor: Colors.green,
              )
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Text("NO",
          //     style: TextStyle(
          //           fontSize: 15
          //     ),),
          //     Switch(
          //       value: switches['night_parking']!['NO']!,
          //       onChanged: (value) {
          //         setState(() {
          //           switches['night_parking']!['NO'] = ! (switches['night_parking']!['NO']!);
          //         });
          //       },
          //       activeColor: Colors.green,
          //     )
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text("Free Parking",
          //       style: TextStyle(
          //           color: Colors.blue[700],
          //           fontSize: 20
          //       ),

          //     ),
          //   ],
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Free Parking",
                style: TextStyle(fontSize: 15),
              ),
              Switch(
                value: switches['free_parking']!['YES']!,
                onChanged: (value) {
                  setState(() {
                    switches['free_parking']!['YES'] =
                        !(switches['free_parking']!['YES']!);
                  });
                },
                activeColor: Colors.green,
              )
            ],
          ),
          //need to find out firebase free parking format
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Text("NO",
          //     style: TextStyle(
          //           fontSize: 15
          //     ),),
          //     Switch(
          //       value: switches['free_parking']!['NO']!,
          //       onChanged: (value) {
          //         setState(() {
          //           switches['free_parking']!['NO'] = ! (switches['free_parking']!['NO']!);
          //         });
          //       },
          //       activeColor: Colors.green,
          //     )
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text("Short Term Parking",
          //       style: TextStyle(
          //           color: Colors.blue[700],
          //           fontSize: 20
          //       ),

          //     ),
          //   ],
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Short Term Parking",
                style: TextStyle(fontSize: 15),
              ),
              Switch(
                value: switches['short_term_parking']!['YES']!,
                onChanged: (value) {
                  setState(() {
                    switches['short_term_parking']!['YES'] =
                        !(switches['short_term_parking']!['YES']!);
                  });
                },
                activeColor: Colors.green,
              )
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Text("NO",
          //     style: TextStyle(
          //           fontSize: 15
          //     ),),
          //     Switch(
          //       value: switches['short_term_parking']!['NO']!,
          //       onChanged: (value) {
          //         setState(() {
          //           switches['short_term_parking']!['NO'] = ! (switches['short_term_parking']!['NO']!);
          //         });
          //       },
          //       activeColor: Colors.green,
          //     )
          //   ],
          // ),
        ]));
  }
}
