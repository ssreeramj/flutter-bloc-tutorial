part of 'test_bloc.dart';

abstract class TestState extends Equatable {
  const TestState();

  @override
  List<Object> get props => [];
}

class TestInitial extends TestState {}

class TestLoading extends TestState {}

class TestLoaded extends TestState {
  final List<User> users;

  TestLoaded(this.users);

  @override
  List<Object> get props => [users];
}

class TestError extends TestState {}
