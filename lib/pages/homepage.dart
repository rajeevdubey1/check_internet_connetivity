import 'package:connectivity_checker/blocs/internet_bloc/internet_bloc.dart';
import 'package:connectivity_checker/blocs/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connectivity Checker'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetBloc, InternetState>(
              builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text('Connected!');
            } else if (state is InternetLostState) {
              return const Text('Not Connected!');
            } else {
              return const Text('Loading...');
            }
          }, listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Internet connected!',),
                  backgroundColor: Colors.green,));
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Internet lost!',),
                  backgroundColor: Colors.red,));
            }
          }),
          // BlocBuilder<InternetBloc, InternetState>(builder: (context, state){

          // }),
        ),
      ),
    );
  }
}
