import 'package:block_sm_flutter/bloc/todo_bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if(state is TodoLoadingState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is TodoLoadedState){
            return ListView.separated(
              itemBuilder: (context, index) => CheckboxListTile(
                    value: state.todoList[index].completed,
                    onChanged: (value) {},
                    title: Text(state.todoList[index].todo.toString()),
                  ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: state.todoList.length);
          }else if(state is TodoerrorState){
            return Center(child: Text("errorrrr..."),);
          }else{
            return SizedBox();
          }
        },
      ),
    );
  }
}
