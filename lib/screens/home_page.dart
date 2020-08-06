import 'package:bloc_tutorial/blocs/foo/test_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Tutorial'),
        centerTitle: true,
      ),
      body: BlocBuilder<TestBloc, TestState>(
        builder: (context, state) {
          if (state is TestInitial) {
            BlocProvider.of<TestBloc>(context).add(FetchUsers());
          }
          if (state is TestError) {
            return Scaffold(
              body: Center(
                child: Text(
                  'Unable to load data even now',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            );
          }
          if (state is TestLoaded) {
            return Scaffold(
              body: Center(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(thickness: 2),
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.person),
                      ),
                      title: Text('${state.users[index].name}'),
                      subtitle: Text(
                        '${state.users[index].email}\n${state.users[index].phone.split(' ')[0]}',
                      ),
                      isThreeLine: true,
                      hoverColor: Colors.grey,
                    );
                  },
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
