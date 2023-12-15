import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_bootcamp_flutter/bloc_leacture/blocs/home_bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(),
          body: Center(child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Text(
                "${state}",
                style: TextStyle(fontSize: 40),
              );
            },
          )),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<HomeBloc>().add(AddToNumberEvent());
            },
            child: Icon(Icons.add),
          ),
        );
  }
}
