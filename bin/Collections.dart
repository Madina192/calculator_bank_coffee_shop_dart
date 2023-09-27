void main() {
  runApp();
}

void runApp() {
  List<Map> students = [
    {'name': 'Madina', 'surname': 'Akpaeva', 'age': 21},
    {'name': 'Adel', 'surname': 'Mukasheva', 'age': 20},
    {'name': 'Zhibek', 'surname': 'Romanbekova', 'age': 21},
    {'name': 'Bermet', 'surname': 'Mamatzhalilova', 'age': 19},
  ];

  List<Student> student = [];
  for (var i in students) {
    student.add(Student(i));
  }
  print(student);
}

class Student {
  String name = '';
  String surname = '';
  int age = 0;

  Student(Map map)
      : name = map['name'],
        surname = map['surname'],
        age = map['age'];

  @override
  String toString() {
    return '$name $surname $age';
  }
}
