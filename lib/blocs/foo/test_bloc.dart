import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/models/barrel.dart';
import 'package:bloc_tutorial/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  final UserRepository repository;

  TestBloc(this.repository) : super(TestInitial());

  // @override
  // TestState get initialState => TestInitial();

  @override
  Stream<TestState> mapEventToState(TestEvent event) async* {
    if (event is FetchUsers) {
      yield TestLoading();
      try {
        final users = await repository.getUsers();
        yield TestLoaded(users);
      } catch (_) {
        yield TestError();
      }
    }
  }
}
