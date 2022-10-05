import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trackmy_mentor/common_widgets/bottom_navigation.dart';

class Dashboard extends StatefulWidget {
 
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      appBar: AppBar(
        title: Text('Dashboard'.toUpperCase()),
        actions: [],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'DASHBOARD',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 15),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      
    );
  }
}
