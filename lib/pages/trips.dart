import 'package:flutter/material.dart';

class TripsPage extends StatefulWidget {
  const TripsPage({super.key});

  @override
  State<TripsPage> createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text("Trips page",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ))),
    );
  }
}
