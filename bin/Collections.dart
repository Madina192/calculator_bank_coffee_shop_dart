void main() {
  //runApp();
  practiceLists();
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

void practiceLists(){
  List<String> list = ['1', '30', '5', '14'];
  list.forEach((element) {                //just do some operations
    print(int.parse(element) * 5);
  });
  list.map((e) => int.parse(e) * 5);      //returns some list
  print(list);
  var filteredList = list.where((element) => int.parse(element) % 2 == 0);
  print(filteredList);
  Map<String, dynamic> users = {
    'user': 'madina',
    'password': 'madina02',
    'balance': 500
  };
  users.forEach((key, value) {
    print('$key : $value');
  });

}

void addElements() {
  List<Map> students = [
    {'name': 'Madina', 'surname': 'Akpaeva', 'age': 21},
    {'name': 'Adel', 'surname': 'Mukasheva', 'age': 20},
    {'name': 'Zhibek', 'surname': 'Romanbekova', 'age': 21},
    {'name': 'Bermet', 'surname': 'Mamatzhalilova', 'age': 19},
  ];
  List<Girl> newStudents = [];
  newStudents = students
      .map(
          (e) => Girl(name: e['name'], surname: e['surname'], age: e['age']))
      .toList();
  print(newStudents);
  print(students);
}

class Girl {
  String name;
  String surname;
  int age;

  Girl({
    required this.name,
    required this.surname,
    required this.age,
  });

  @override
  String toString() {
    return '$name $surname $age';
  }
}