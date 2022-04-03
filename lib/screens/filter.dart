import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_2/Database/carparkDetail.dart';

class filter extends StatefulWidget {
  static Map<String, List<String>> userFilters = {};
  @override


  State<StatefulWidget> createState () {
    return _filterState();
  }

  static Map<String, List<String>> returnFilters() {
    userFilters = _filterState.getFilters();
    return userFilters;
  }

}

class _filterState extends State<filter> {
  Map<String, Map<String,bool>> switches = {'Carpark Type': {'Open':false, 'Multi':false, 'Basement':false}, 'Parking System': {'Electronic':false, 'Coupon':false, 'None':false}};
  static Map<String, List<String>> filters = {'Carpark Type':[],'Parking System':[]};
  
  static Map<String, List<String>> getFilters() {
    return filters;
  }
  
  static List<carparkDetail> filterExecute(Map<String, List<String>> filters,List<carparkDetail> carparks){
        List<carparkDetail> filtered1 = [];
        List<carparkDetail> filtered2 = [];

          for(int i = 0; i< filters.length;i++){
              String key = filters.keys.elementAt(i); //Carpark Type , Parking 

              List<String> value = filters.values.elementAt(i); //Open, Multi, Basement

            for(int j=0; j< value.length;j++){
              String name = value.elementAt(j); //Open OR Multi OR Basement

              for(int z = 0; z<carparks.length;z++){
                carparkDetail car = carparks.elementAt(z); // 1 carpark detail object

                if(key == "Carpark Type" && name == car.carpark_type){
                  filtered1.add(car);
                }

                else if(key == "Parking System" && name == car.parking_type){
                  filtered1.add(car);
                }
              }
              filtered2 = filtered1;

            }

          }        
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Apply Filters"),
            backgroundColor: Color.fromARGB(255, 20, 27, 66)
        ),
        body: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      for (int i=0; i<switches.length; i++) {
                        String main_key = switches.keys.elementAt(i);
                        Map<String, bool> cur = switches.values.elementAt(i);
                        for (int j=0; j<cur.length; j++) {
                          String key = cur.keys.elementAt(j);
                          if (cur.values.elementAt(j) == true) {
                            filters[main_key]?.add(key);
                            print(filters);
                          }


                        }
                      }
                    });
                  },
                  child: Text("Apply",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        backgroundColor: Colors.black,
                      )))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Car Park Type",
                style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: 30
                ),
),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Open Space",
              style: TextStyle(
                    fontSize: 20
              ),),
              Switch(
                value: switches['Carpark Type']!['Open']!,
                // value: true,
                onChanged: (value) {
                  setState(() {
                    switches['Carpark Type']!['Open'] = ! (switches['Carpark Type']!['Open']!);
                  });
                },
                activeColor: Colors.green,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Multi Story",
              style: TextStyle(
                    fontSize: 20
              ),),
              Switch(
                value: switches['Carpark Type']!['Multi']!,
                onChanged: (value) {
                  setState(() {
                    switches['Carpark Type']!['Multi'] = ! (switches['Carpark Type']!['Multi']!);
                  });
                },
                activeColor: Colors.green,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Basement",
              style: TextStyle(
                    fontSize: 20
              ),),
              Switch(
                value: switches['Carpark Type']!['Basement']!,
                onChanged: (value) {
                  setState(() {
                    switches['Carpark Type']!['Basement'] = ! (switches['Carpark Type']!['Basement']!);
                  });
                },
                activeColor: Colors.green,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Parking System",
                style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: 30
                ),


              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Electronic",
              style: TextStyle(
                    fontSize: 20
              ),),
              Switch(
                value: switches['Parking System']!['Electronic']!,
                onChanged: (value) {
                  setState(() {
                    switches['Parking System']!['Electronic'] = ! (switches['Parking System']!['Electronic']!);
                  });
                },
                activeColor: Colors.green,
              )
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Text("None"),
          //     Switch(
          //       value: switches['Parking System']!['None']!,
          //       // value: true,
          //       onChanged: (value) {
          //         setState(() {
          //           switches['Parking System']!['None'] = ! (switches['Parking System']!['None']!);
          //         });
          //       },
          //       activeColor: Colors.green,
          //     )
          //   ],
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Coupon",
              style: TextStyle(
                    fontSize: 20
              ),),
              Switch(
                value: switches['Parking System']!['Coupon']!,
                onChanged: (value) {
                  setState(() {
                    switches['Parking System']!['Coupon'] = ! (switches['Parking System']!['Coupon']!);
                  });
                },
                activeColor: Colors.green,
              )
            ],
          ),

        ])


    );
  }

}