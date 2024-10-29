part of 'to_do_list_screen_bloc.dart';

@immutable
abstract class ToDoListScreenState {}

final class ToDoListScreenInitial extends ToDoListScreenState {
}

class AddTaskState extends ToDoListScreenState{
  final String title;
  final bool isCompleted;

  AddTaskState( {required this.title, 
   this.isCompleted=false});


}
class ClickCheckBoxState extends ToDoListScreenState{
  final int index;

  ClickCheckBoxState({required this.index});

}