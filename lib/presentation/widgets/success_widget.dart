import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/data/models/todo_model.dart';
import 'package:todo_app/presentation/bloc/todo_bloc.dart';

class SuccessWidget extends StatefulWidget {
  const SuccessWidget({super.key});

  @override
  State<SuccessWidget> createState() => _SuccessWidgetState();
}

class _SuccessWidgetState extends State<SuccessWidget> {
  removeTodo(Todo todo) {
    context.read<TodoBloc>().add(
          RemoveTodo(todo),
        );
  }

  alertTodo(int index) {
    context.read<TodoBloc>().add(
          AlterTodo(index),
        );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.todos.length,
      itemBuilder: (context, int i) {
        return Card(
            color: Theme.of(context).colorScheme.primary,
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Slidable(
              key: const ValueKey(0),
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (_) {
                      removeTodo(state.todos[i]);
                    },
                    backgroundColor: const Color(0xFFFFF),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: ListTile(
                  title: Text(state.todos[i].title),
                  subtitle: Text(state.todos[i].subtitle),
                  trailing: Checkbox(
                    value: state.todos[i].isDone,
                    activeColor: Theme.of(context).colorScheme.secondary,
                    onChanged: ((value) {
                      alertTodo(i);
                    }),
                  )),
            ));
      },
    );
  }
}
