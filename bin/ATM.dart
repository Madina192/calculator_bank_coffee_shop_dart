import 'dart:io';

List<Map<String, dynamic>> users = [
  {'role': 'admin', 'login': 'madina', 'password': '1234'},
  {'role': 'client', 'login': 'user001', 'password': '5678', 'balance': 500},
  {'role': 'client', 'login': 'user002', 'password': '5678', 'balance': 700},
  {'role': 'client', 'login': 'user003', 'password': '5678', 'balance': 800}
];

void main() {
  Controller controller = Controller();
  print("Welcome to Ala-Too bank!");
  auth(controller);
}

void auth(Controller controller) {
  bool isValid = false;
  while (!isValid) {
    var login = inputHandler(outputText: 'Login: ');
    var password = inputHandler(outputText: 'Password: ');
    for (var i = 0; i < users.length; i++) {
      if (login == users[i]['login'] && password == users[i]['password']) {
        directUser(controller, users[i]['role'], login);
        isValid = true;
      }
    }
    //isValid = !isDone(); //fix it!!!
  }
}

void directUser(Controller controller, String role, String login) {
  switch (role) {
    case 'client':
      controller.askForClientAction(login);
    case 'admin':
      controller.askForAdminAction();
  }
}

bool isDone() =>
    inputHandler(outputText: 'Try again? (Yes, No)').toLowerCase() == 'yes'
        ? true
        : false;

String inputHandler({required String outputText}) {
  stdout.writeln(outputText);
  return stdin.readLineSync() as String;
}

//CONTROLLER
class Controller {
  View view = View();
  UserAdmin userAdmin = UserAdmin();

  void askForAdminAction() {
    var adminAction =
        inputHandler(outputText: 'Choose action: 1 - add user, 2 - show users');
    switch (adminAction) {
      case '1':
        userAdmin.addUser();
        view.showUsers();
      case '2':
        view.showUsers();
    }
  }

  void askForClientAction(String login) {
    var clientAction = inputHandler(
        outputText: 'choose action: 1 - show balance, 2 - deposit');
    switch (clientAction) {
      case '1':
        view.showBalance(login);
      case '2':
        deposit(login);
    }
  }

  void deposit(String login) {
    users.forEach((user) {
      if (user['login'] == login) {
        user['balance'] +=
            int.parse(inputHandler(outputText: 'Enter amount: '));
        view.showBalance(login);
      }
    });
  }
}

//VIEW
class View {
  void showUsers() {
    print(users);
  }

  void showBalance(String login) {
    users.forEach((user) {
      if (user['login'] == login) {
        print('Your balance: ${user['balance']}');
      }
    });
  }
}

//MODELS
class UserAdmin {
  Map<String, dynamic> newClient = {};

  void addUser() {
    bool wantAddMore = true;
    while (true) {
      var login = inputHandler(outputText: 'Enter login for a new user: ');
      var password = inputHandler(outputText: 'Enter password for a new user: ');
      var balance = inputHandler(outputText: 'Enter balance for a new user: ');
      newClient = {
        'role': 'client',
        'login': login,
        'password': password,
        'balance': balance
      };
      users.add(newClient);
      wantAddMore =
          inputHandler(outputText: 'Add more users? yes, no').toLowerCase() ==
              'yes'
              ? true
              : false;
      if (!wantAddMore) {
        break;
      }
    }
  }
}

class Client {
  String login;
  String password;
  int balance;

  Client({
    required this.login,
    required this.password,
    required this.balance,
  });

  @override
  String toString() {
    return '$login $password';
  }
}
