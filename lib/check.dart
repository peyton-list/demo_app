import 'package:demo_app/step.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'fit_check_demo.dart';
import 'step.dart';

void main() => runApp(Check());

class Check extends StatefulWidget {
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {

  void _getHealthDataPoints() async {

//    List<HealthDataType> types = [
//      HealthDataType.STEPS,
//      HealthDataType.HEART_RATE,
//    ];
//
//    DateTime startDate = DateTime.utc(2001, 01, 01);
//    DateTime endDate = DateTime.now();
//
//    List<HealthDataPoint> healthDataList = List<HealthDataPoint>();

    Future.delayed(Duration(seconds: 2), () async {
      bool isAuthorized = await Health.requestAuthorization();
//      if (isAuthorized) {
//        for (HealthDataType type in types) {
//          /// Calls to 'Health.getHealthDataFromType' must be wrapped in a try catch block.
//          try {
//            List<HealthDataPoint> healthData = await Health.getHealthDataFromType(startDate, endDate, type);
//            healthDataList.addAll(healthData);
//          } catch (exception) {
//            print(exception.toString());
//          }
//        }
//      }
//      /// Do something with the health data list
//      for (var healthData in healthDataList) {
//        print(healthData);
//      }
        if(isAuthorized) {
          print('FUUUUUUUUUCKING AUTHORIZED');
        }
    });
  }

  @override
  void initState() {
    super.initState();
    _getHealthDataPoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('check'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue[100], Colors.blue[400]],
          ),
        ),
        child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FitCheckDemo()),
                );
              },
              color: Colors.deepPurple,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Fit Kit',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StepDemo()),
                );
              },
              color: Colors.deepPurple,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Step',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ],
        ),
      ),
    );
  }


}