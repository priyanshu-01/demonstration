import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/bloc/repositorylist_bloc.dart';
import 'presentation/homeBody.dart';

Future<void> main() async {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GraphQL Api',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
            create: (_) => RepositorylistBloc(),
            child: MyHomePage(title: 'My github repositories')));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<RepositorylistBloc, RepositorylistState>(
        builder: (_, state) {
          print("state is $state");
          if (state is RepositorylistInitial) {
            return Center(child: Text("Unintialised State"));
          } else if (state is RepositorylistFetching) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RepositorylistFetchedState) {
            final repositoryList = state.repositories;
            return HomeBody(repositoryList: repositoryList);
          } else {
            return Center(child: Text("Something went wrong"));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.read<RepositorylistBloc>().add(RepositoriesFetchRequested());
        },
        tooltip: 'fetch data',
        child: Icon(Icons.replay_outlined),
      ),
    );
  }
}
