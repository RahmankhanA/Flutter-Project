// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoModel {
  final String name;
  bool isCompleted = false;
  TodoModel({
    required this.name,
     this.isCompleted=false,
  });

  // TodoModel({required this.name});

  @override
  String toString() => 'TodoModel(name: $name, isCompleted: $isCompleted)';
}
