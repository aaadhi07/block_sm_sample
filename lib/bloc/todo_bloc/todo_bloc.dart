import 'package:bloc/bloc.dart';
import 'package:block_sm_flutter/models/todo_res_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitialState()) {
    on<FetchTodo>((event, emit) async {
      final url = Uri.parse("https://dummyjson.com/todos");
      emit(TodoLoadingState());
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          TodoResModel resModel = todoResModelFromJson(response.body);
          emit(TodoLoadedState(todoList: resModel.todos ?? []));
        } else {
          print("error");
          emit(TodoerrorState());
        }
      } catch (e) {
        print(e.toString());
        emit(TodoerrorState());
      }
    });
  }
}
