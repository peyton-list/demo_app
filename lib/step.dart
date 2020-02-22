import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'fit_check_demo.dart';

void main() => runApp(StepDemo());

class StepDemo extends StatefulWidget {
  @override
  _StepDemoState createState() => _StepDemoState();
}

class _StepDemoState extends State<StepDemo> {

  void _getHealthDataPoints() async {

    List<HealthDataType> types = [
      HealthDataType.STEPS,
      HealthDataType.HEART_RATE,
    ];

    DateTime startDate = DateTime.utc(2001, 01, 01);
    DateTime endDate = DateTime.now();

    List<HealthDataPoint> healthDataList = List<HealthDataPoint>();

    Future.delayed(Duration(seconds: 2), () async {
      bool isAuthorized = await Health.requestAuthorization();
      if (isAuthorized) {
        for (HealthDataType type in types) {
          /// Calls to 'Health.getHealthDataFromType' must be wrapped in a try catch block.
          try {
            List<HealthDataPoint> healthData = await Health.getHealthDataFromType(startDate, endDate, type);
            healthDataList.addAll(healthData);
          } catch (exception) {
            print(exception.toString());
          }
        }
      }
      /// Do something with the health data list
      for (var healthData in healthDataList) {
        print(healthData);
      }
      if(isAuthorized) {
        print('FUUUUUUUUUCKING AUTHORIZED FUCKKKKKKK');
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
        title: Text('step check demo'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue[100], Colors.amber[400]],
          ),
        ),
      ),
    );
  }


}