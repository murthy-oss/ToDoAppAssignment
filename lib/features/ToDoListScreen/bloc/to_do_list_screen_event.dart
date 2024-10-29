part of 'to_do_list_screen_bloc.dart';

@immutable
abstract class ToDoListScreenEvent {}

class AddTaskEvent extends ToDoListScreenEvent{
  final String title;
  final bool Iscomplted;
  AddTaskEvent({required this.title, this.Iscomplted=false});
}

class ClickCheckBoxEvent extends ToDoListScreenEvent{
  final int index;

  ClickCheckBoxEvent({required this.index});

}