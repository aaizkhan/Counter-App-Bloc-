import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_counter_app/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_counter_app/presentation/home_screen.dart';
import 'package:flutter_bloc_counter_app/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_counter_app/presentation/screens/third_screen.dart';

class AppRouter {
  final CounterCubit counterCubit = CounterCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: counterCubit,
                  child: const HomeScreen(title: 'Home Screen'),
                ));

      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: counterCubit,
                  child: const SecondScreen(title: 'Second Screen'),
                ));

      case '/third':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: counterCubit,
                  child: const ThirdScreen(title: 'Third Screen'),
                ));

      default:
        return null;
    }
  }
}
