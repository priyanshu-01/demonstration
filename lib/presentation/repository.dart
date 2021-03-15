import 'package:flutter/material.dart';
import '../logic/models/repositories.dart';

class RepositoryWidget extends StatelessWidget {
  final Repositories repositories;
  RepositoryWidget({this.repositories});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          repositories.name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        tileColor: Colors.orange[600],
      ),
    );
  }
}
