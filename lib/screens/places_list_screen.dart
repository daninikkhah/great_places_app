import 'package:flutter/material.dart';

class PlacesListScreen extends StatelessWidget {
  static const String route = 'PlacesListScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places'),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: null),
        ],
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
