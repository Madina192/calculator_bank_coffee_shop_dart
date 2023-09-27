
void main(List<String> arguments) {
  runApp();
}

void runApp() {
  Dogs dog = Dogs();
  print(dog.legs);
  Student madina = Student("Madina", "Akpaeva");
  print(madina.toString());
}

class Animal {
  int legs;
  Animal({this.legs = 4});
}

class Dogs extends Animal {

}

class Cats implements Animal {
  @override
  int legs = 0;
}

class Student{
  var name;
  var surname;
  var fullname;
  Student(this.name, this.surname) : fullname = name + surname;
  Student.myLiked();
}