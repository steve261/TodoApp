import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/presentation/bloc/todo_events.dart';
import 'package:todo_app/presentation/bloc/todo_bloc.dart';
import 'package:todo_app/presentation/pages/homescreen.dart';

//import  ShowDialogz();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage=await HydratedStorage.build(
   storageDirectory: await getTemporaryDirectory(),
  )
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YoTodo App',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
           background: Colors.white,
           onBackground: Colors.black,
           primary: Colors.lightGreen,
           onPrimary: Colors.white,
           secondary: Colors.lightGreen,
           onSecondary: Colors.white
        ),
        //textTheme: TextTheme(),
       
        useMaterial3: true,
      ),
      home: BlocProvider<TodoBloc>(
        create: ((context) =>  TodoBloc()..add(
          TodoStarted(),
        ),child: const HomeScreen()),
     
    ));
  }
}
