import 'package:demonstration/logic/models/repositories.dart';
import 'package:flutter/material.dart';

import 'repository.dart';

class HomeBody extends StatelessWidget {
  final List<Repositories> repositoryList;
  HomeBody({this.repositoryList});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return RepositoryWidget(repositories: repositoryList[index]);
          },
          itemCount: repositoryList.length,
        ),
      ),
    );
  }
}
