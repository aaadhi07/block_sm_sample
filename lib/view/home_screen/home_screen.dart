import 'package:block_sm_flutter/bloc/counter_bloc.dart';
import 'package:block_sm_flutter/view/home_screen/color_screen/color_screen.dart';
import 'package:block_sm_flutter/view/todo_screen/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ColorScreen(),));
          }, icon: Icon(Icons.colorize_outlined)),
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TodoScreen(),));
          }, icon: Icon(Icons.dark_mode_outlined))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterBloc>().add(IncrementEvent());
        },
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Text(state.count.toString()
            ),
          );
        },
      ),
    );
  }
}
