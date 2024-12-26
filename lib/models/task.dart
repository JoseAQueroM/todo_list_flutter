class Task {
  final String name;
  bool isDone;

  Task({
    required this.name,
    this.isDone = false,
  });

  void toggleDone(){
    isDone = !isDone;
  }

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'isDone' : isDone,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map){
    return Task(
      name: map['name'],
      isDone: map['isDone'],
    );
  }
  
}