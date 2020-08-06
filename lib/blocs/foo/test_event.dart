part of 'test_bloc.dart';

abstract class TestEvent extends Equatable {
  const TestEvent();
}

class FetchUsers extends TestEvent {
  const FetchUsers();

  @override
  List<Object> get props => [];
}
