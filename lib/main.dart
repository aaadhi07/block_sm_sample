import 'package:block_sm_flutter/bloc/colors_bloc/colors_bloc.dart';
import 'package:block_sm_flutter/bloc/counter_bloc.dart';
import 'package:block_sm_flutter/bloc/todo_bloc/todo_bloc.dart';
import 'package:block_sm_flutter/view/home_screen/color_screen/color_screen.dart';
import 'package:block_sm_flutter/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => CounterBloc(),
      ),
      BlocProvider(
        create: (context) => ColorsBloc(),
      ),
      BlocProvider(
        create: (context) => TodoBloc()..add(FetchTodo()),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
