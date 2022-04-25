import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_counter_app/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_counter_app/presentation/home_screen.dart';
import 'package:flutter_bloc_counter_app/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_counter_app/presentation/screens/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit counterCubit = CounterCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Bloc Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => BlocProvider.value(
                value: counterCubit,
                child: const HomeScreen(title: 'Home Screen'),
              ),
          '/second': (context) => BlocProvider.value(
                value: counterCubit,
                child: const SecondScreen(title: 'Second Screen'),
              ),
          '/third': (context) => BlocProvider.value(
                value: counterCubit,
                child: const ThirdScreen(title: 'Third Screen'),
              )
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    counterCubit.close();
  }
}
