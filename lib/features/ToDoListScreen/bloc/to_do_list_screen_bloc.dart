import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todolistapp/features/ToDoListScreen/model/Task_model.dart';

part 'to_do_list_screen_event.dart';
part 'to_do_list_screen_state.dart';

class ToDoListScreenBloc extends Bloc<ToDoListScreenEvent, ToDoListScreenState> {
  ToDoListScreenBloc() : super(ToDoListScreenInitial( )) {
    on<AddTaskEvent>(addTaskEvent);

  }

  FutureOr<void> addTaskEvent(AddTaskEvent event, Emitter<ToDoListScreenState> emit) {
    
      emit(AddTaskState(
        title: 
        event.title,
        ));
  
  }
}
