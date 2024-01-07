class Todo {
  final String title;
  final String description;
  bool isCompleted;

  Todo({this.title = "", this.description = "", this.isCompleted = false});

//what does this copyWith class do
  Todo copyWith({
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return Todo(
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
@override
  factory Todo.fromjson(Map<String, dynamic> json) {
    return ( 
      title: json['title'],
      description: json['description'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String,dynamic> Todo.tojson(){
    return(
      'title': title,
      'description':description,
      'isCompleted':isCompleted,
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return '''Todo(
      title: $title\n
      description: $description\n
      isCompleted: $isCompleted\n
    )''';
  }
}
