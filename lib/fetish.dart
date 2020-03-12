import 'package:fit_kit/fit_kit.dart';
import 'package:flutter/material.dart';

class Fetish extends StatefulWidget {
  @override
  _FetishState createState() => _FetishState();
}

class _FetishState extends State<Fetish> {

  static var now = DateTime.now();
  final yesterday = DateTime(now.year, now.month, now.day - 1);

  void read() async {
    print(now);
    print(yesterday);
    print('DATTTTTTTTTTTTTTTEEEEEEEEEEE');
    final results = await FitKit.read(
      DataType.STEP_COUNT,
      dateFrom: DateTime.utc(
        yesterday.year,
        yesterday.month,
        yesterday.day,
        yesterday.hour,
        yesterday.minute,
        yesterday.second
      ),
      dateTo: DateTime.now(),
    );
    print(results);
  }

  void sleep() async {
    final results = await FitKit.read(
      DataType.SLEEP,
      dateFrom: DateTime.utc(
          yesterday.year,
          yesterday.month,
          yesterday.day,
          yesterday.hour,
          yesterday.minute,
          yesterday.second
      ),
      dateTo: DateTime.now(),
    );
    print(results);
  }

  void readLast() async {
    final result = await FitKit.readLast(DataType.HEIGHT);
  }

  void readAll() async {
    if (await FitKit.requestPermissions(DataType.values)) {
      for (DataType type in DataType.values) {
        final results = await FitKit.read(
          type,
            dateFrom: DateTime.utc(
                yesterday.year,
                yesterday.month,
                yesterday.day,
                yesterday.hour,
                yesterday.minute,
                yesterday.second
            ),
          dateTo: DateTime.now(),
        );
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    read();
    print('SLEEEEEEEEEEEEEEEEP');
    sleep();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('fit check demo'),
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
      ),
    );;
  }
}
