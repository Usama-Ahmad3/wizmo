import 'package:flutter/material.dart';

class ViewMyCars extends StatefulWidget {
  const ViewMyCars({super.key});

  @override
  State<ViewMyCars> createState() => _ViewMyCarsState();
}

class _ViewMyCarsState extends State<ViewMyCars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cars'),
      ),
    );
  }
}
