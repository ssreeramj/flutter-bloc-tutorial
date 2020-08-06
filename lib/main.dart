import 'package:bloc_tutorial/blocs/foo/test_bloc.dart';
import 'package:bloc_tutorial/networking/api_client.dart';
import 'package:bloc_tutorial/repositories/repositories.dart';
import 'package:bloc_tutorial/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserRepository repository = UserRepository(UserApiClient());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => TestBloc(repository),
        child: MyHomePage(),
      ),
    );
  }
}
