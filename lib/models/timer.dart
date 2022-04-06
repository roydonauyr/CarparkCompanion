import 'dart:async';
//import 'package:async/async.dart';
import 'package:flutter_application_2/services/apiLTA.dart';

final APItimer = Timer.periodic(
  const Duration(seconds: 30),
  (timer) async {
    final api = APIServiceLTA();
    var data = await api.fetch();
    print(data.length);
    print(data[50].carParkId);
    print(data[50].availableLots);
  },
);



// to stop timer:
// use APItimer.cancel();
