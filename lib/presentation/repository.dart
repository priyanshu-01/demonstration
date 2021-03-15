import 'package:flutter/material.dart';

class Repository extends StatelessWidget {
  final repository;
  Repository({this.repository});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          repository["name"],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        tileColor: Colors.orange[600],
      ),
    );
  }
}
