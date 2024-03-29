import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/presentation/bloc/todo_bloc.dart';
import 'package:todo_app/presentation/widgets/success_widget.dart';
/*import 'package:todo_app/presentation/bloc/todo_events.dart';
import 'package:todo_app/presentation/bloc/todo_events.dart';
import 'package:todo_app/presentation/bloc/todo_state.dart';
*/
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  addTodo(Todo todo){
    context.read<TodoBloc>().add(
      AddTodo(todo),
    );
  }

  removeTodo(Todo todo){
    context.read<TodoBloc>().add(
      RemoveTodo(todo),
    );
  }
  alertTodo(int index){
    context.read<TodoBloc>().add(
      AlterTodo(index),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
  floatingActionButton: FloatingActionButton(
    onPressed:(){
      showDialog(
        context: context,
        builder:(context){
          TextEditingController controller1=TextEditingController();
          TextEditingController controller2=TextEditingController();


          return AlertDialog(
            title: const Text("Add a Task"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: controller1,
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  decoration: InputDecoration(
                   hintText:"Task Title..",
                   focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                    )
                   ),
                   border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.grey
                    ))
                  )
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: controller2,
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  decoration: InputDecoration(
                   hintText:"Task description..",
                   focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                    )
                   ),
                   border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.grey
                    ))
                  )
                ),
              ]),
              actions: [
                Padding(padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  onPressed:(){
                    addTodo(
                      Todo(title: controller1.text,
                      subtitle:controller2.text));
                      controller1.text='';
                      controller2.text='';
                      Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color:Theme.of(context).colorScheme.secondary ),
                            borderRadius: BorderRadius.circular(10),
                        ),
                        foregroundColor: Theme.of(context).colorScheme.secondary,
                      ), 
                      child: SizedBox(
                        width:MediaQuery.of(context).size.width,
                        child: SizedBox(child: const Icon(Icons.check_mark,
                        color: Colors.green,
                        )),
                      ),


                      ) ,
                )
              ],
          );
        });
    },
    backgroundColor: Theme.of(context).colorScheme.primary,
    child: const Icon(
      Icons.add,
      color:Colors.black,
    ),
     ),
     appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        title: const Text(
          'YoTodo App',
          style:TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
     ),
     body: Padding(
      padding:const EdgeInsets.all(8.0),
      child: BlocBuilder<TodoBloc,TodoState>(){
        builder:(context, state){
          if(state.status==TodoStatus.success{
            return SuccessWidget();
          }else if (state.status==TodoStatus.initial){
            return const Center(child:CircularProgressIndicator());
          }else(return Container();))
        }
      }),
    
    );
  }
}
