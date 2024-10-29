class Task{
  final String title;
   bool isCompleted;

  Task( {required this.title,required this.isCompleted});
}
class ToDoListScreenInitial {
  final List<Task> tasks;
  ToDoListScreenInitial(this.tasks);
}
