import 'dart:io';

Map<String, dynamic> users = {
  'user': 'madina',
  'password': 'madina02',
  'balance': 500
};

void main() {
  Controller controller = Controller();
  print("Welcome to Ala-Too bank!");
  var role = inputHandler(outputText: 'Choose role: 1 - client, 2 - admin');
  switch (role) {
    case '2':
      controller.addUser();
  }
  controller.showUsers();
}

void runApp() {
  while (true) {
    var action = inputHandler(
        outputText: 'choose action: 1 - show balance, 2 - deposit');
    performAction(action);
  }
}

void performAction(String action) {
  switch (action) {
    case '1':
      print(users['balance']);
    case '2':
      users['balance'] += int.parse(inputHandler(outputText: 'enter amount: '));
      print(users['balance']);
  }
}

void auth() {
  bool isValid = false;
  while (!isValid) {
    var login = inputHandler(outputText: 'Login: ');
    var password = inputHandler(outputText: 'Password: ');
    if (login == users['user'] && password == users['password']) {
      runApp();
      break;
    } else {
      isValid = !isDone();
    }
  }
}

bool isDone() =>
    inputHandler(outputText: 'Try again? (Yes, No)').toLowerCase() == 'yes';

String inputHandler({required String outputText}) {
  stdout.writeln(outputText);
  return stdin.readLineSync() as String;
}

class Client {
  String login;
  String password;

  Client({
    required this.login,
    required this.password,
  });

  @override
  String toString() {
    return '$login $password';
  }
}

class Controller {
  View view = View();
  UserAdmin userAdmin = UserAdmin();

  void showUsers() {
    view.showUsers(userAdmin.users);
  }

  void addUser() {
    userAdmin.addUser();
  }
}

class View {
  void showUsers(List<Client> users) {
    print(users);
  }

  void showBalance(int balance) {}
}

class UserAdmin {
  List<Client> users = [];
  var login = inputHandler(outputText: 'Enter login: ');
  var password = inputHandler(outputText: 'Enter password: ');
  var action =
      inputHandler(outputText: 'Choose action: 1 - add user, 2 - show users');

  void askForAction(String action) {
    switch (action) {
      case '1':
        addUser();
      case '2':
    }
  }

  void addUser() {
    users.add(Client(login: login, password: password));
  }
}
