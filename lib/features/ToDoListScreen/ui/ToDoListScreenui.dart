
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todolistapp/design/app_colors.dart';
import 'package:todolistapp/features/ToDoListScreen/bloc/to_do_list_screen_bloc.dart';
import 'package:todolistapp/features/ToDoListScreen/model/Task_model.dart';
import 'package:todolistapp/widgets/textfield_widget.dart';

class toDoListScreenuiPage extends StatefulWidget {
  const toDoListScreenuiPage({super.key});

  @override
  State<toDoListScreenuiPage> createState() => _toDoListScreenuiPageState();
}

class _toDoListScreenuiPageState extends State<toDoListScreenuiPage> {
 final List<Task> ListOfTasks=[];
  TextEditingController _controller = TextEditingController();
final _toDoListScreenuibloc=ToDoListScreenBloc();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accentColor,
        foregroundColor: AppColors.majorColor,
        title: Center(child: const Text('To-Do APP')),
      ),
      body: Padding(

      padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
        child: BlocConsumer<ToDoListScreenBloc, ToDoListScreenState>(
          bloc: _toDoListScreenuibloc,
          listener: (context, state) {
            if( state is AddTaskState){
                ListOfTasks.add(Task(title: state.title, isCompleted: state.isCompleted));
            
            }
            else if(state is ClickCheckBoxState){
              ListOfTasks[state.index].isCompleted=!ListOfTasks[state.index].isCompleted;
            }
            
            
          },
          
          builder: (context, state) {
            if (ListOfTasks.isEmpty){
              return Center(child: Text("Task Not added Yet"),);
            }
            else
            {return ListView.builder(
              
              itemCount: ListOfTasks.length,
            
              itemBuilder: (context, index) {
                final task = ListOfTasks[index];
                return Padding(
                  padding:  EdgeInsets.symmetric(vertical: 5.h),
                  child: ListTile(
                  shape: Border.all(
                  
                  ),
                    title: Text(
                      task.title,
                      style: TextStyle(
                        decoration: task.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    trailing: Checkbox(
                      value: task.isCompleted,
                      onChanged: (_) {
                       _toDoListScreenuibloc.emit(ClickCheckBoxState(index: index));
                      },
                    ),
                  ),
                );
              },
            );}
          },
        ),
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.accentColor,
          foregroundColor: AppColors.majorColor,
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Task'),
          content: Form(
            key: _formKey,
            child: MyTextField(
              hintText: 'Enter task',
              controller: _controller, 
              obscure: false,
               selection: false, 
               keyboardtype:TextInputType.name,
              validator: (value) {
                  if (value == null || value.isEmpty) {
                return 'Please enter a task';
              }
              return null;
              },
             
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _controller.clear();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _toDoListScreenuibloc.emit(AddTaskState(title: _controller.text));
                  _controller.clear();
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
