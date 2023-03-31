// ignore_for_file: prefer_const_constructors

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  var markers = HashSet<Marker>();

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    GoogleMap(
      initialCameraPosition:
          CameraPosition(target: LatLng(36.706766, 4.045994), zoom: 10),
    ),
    Text(
      'Index 1: questions',
      style: optionStyle,
    ),
    Text(
      'Index 2: rendez-vous',
      style: optionStyle,
    ),
    Text(
      'Index 3:more',
      style: optionStyle,
    ),
  ];

  ValueNotifier<Color> _appBarColor =
      ValueNotifier<Color>(Colors.red); // initial color

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          _appBarColor.value = Colors.red;
          break;
        case 1:
          _appBarColor.value = Colors.green;
          break;
        case 2:
          _appBarColor.value = Colors.purple;
          break;
        case 3:
          _appBarColor.value = Colors.pink;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '   Pulse',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: _appBarColor.value, // use ValueNotifier here
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          Icon(Icons.water_drop_sharp, color: Colors.white),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: 'Questions',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'rendez-vous',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'more',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
