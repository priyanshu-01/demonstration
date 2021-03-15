part of 'repositorylist_bloc.dart';

@immutable
abstract class RepositorylistEvent {}

class RepositoriesFetchRequested extends RepositorylistEvent {
  RepositoriesFetchRequested();
}
