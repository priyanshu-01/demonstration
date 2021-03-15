import 'package:flutter/material.dart';

import 'repository.dart';

class HomeBody extends StatelessWidget {
  final List repositoryList;
  HomeBody({this.repositoryList});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Repository(repository: repositoryList[index]);
          },
          itemCount: repositoryList.length,
        ),
      ),
    );
  }
}
