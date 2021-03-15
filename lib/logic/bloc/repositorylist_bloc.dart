import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demonstration/logic/models/repositories.dart';
import 'package:meta/meta.dart';

import '../services/query.dart';

part 'repositorylist_event.dart';
part 'repositorylist_state.dart';

class RepositorylistBloc
    extends Bloc<RepositorylistEvent, RepositorylistState> {
  RepositorylistBloc() : super(RepositorylistInitial());

  @override
  Stream<RepositorylistState> mapEventToState(
    RepositorylistEvent event,
  ) async* {
    yield RepositorylistInitial();
    List<Repositories> repositories = [];
    try {
      if (event is RepositoriesFetchRequested) {
        yield RepositorylistFetching();

        repositories = await readRepositories();
      }
      if (repositories.length == 0) {
        yield RepositorylistInitial();
      } else {
        yield RepositorylistFetchedState(repositories: repositories);
      }
    } catch (_) {
      yield RepositorylistError();
    }
  }
}
