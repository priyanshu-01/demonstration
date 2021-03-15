part of 'repositorylist_bloc.dart';

@immutable
abstract class RepositorylistState {}

class RepositorylistInitial extends RepositorylistState {}

class RepositorylistFetching extends RepositorylistState {}

class RepositorylistError extends RepositorylistState {}

class RepositorylistFetchedState extends RepositorylistState {
  final List<Repositories> repositories;
  RepositorylistFetchedState({@required this.repositories});
}
