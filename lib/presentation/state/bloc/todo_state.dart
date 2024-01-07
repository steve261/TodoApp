part of 'todo_bloc.dart';

enum TodoStatus { initial, loading, success, error }

class TodoState extends Equatable {
  final List<Todo> todos;
  final TodoStatus status;


  const TodoState({
    this.todos=const <Todo>[],
    this.status=TodoStatus.initial,
  });


TodoState copyWith({
    TodoStatus? status,
    List<Todo>? todos,
    
  }) {
    return TodoState(
      status:status?? this.status,
      todos:todos?? this.todos,
          );
  }

@override
  factory TodoState.fromjson(Map<String, dynamic> json) {
    try {
      var listOfTodos={json['todo'] as List<dynamic>}
      .map((e) => Todo.fromjson(e as Map<String,dynamic>))
      .toList();

      return TodoState( 
        todos: listOfTodos,
        status: TodoStatus.values.firstWhere(
          (element) => element.name.toString()==json['status']),
      
    );
    } catch (e) {
      rethrow;
    }
    
  }
  Map<String,dynamic>tojson(){
    return (
      'todo': todos,
      'status': status.name,
    );
  }
  @override
  List<Object?> get props => [todos, status];
}
 
