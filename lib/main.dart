import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todolistapp/design/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolistapp/features/ToDoListScreen/bloc/to_do_list_screen_bloc.dart';
import 'package:todolistapp/features/ToDoListScreen/ui/ToDoListScreenui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    print("height:$height");
    print("width:$width");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenUtilInit(
          designSize: Size(width, height), child: toDoListScreenuiPage()),
    );
  }
}
