import 'dart:io';

Map users = {'login': 'madina', 'password': '1234', 'balance': 2000};

void main() {
  print('Welcome to our bank!');
  auth();
}

void auth() {
  bool isValid = false;
  while (!isValid) {
    var login = inputHandler(outputText: 'Enter login: ');
    var password = inputHandler(outputText: 'Enter password: ');
    if (login == users['login'] && password == users['password']) {
      runApp();
      isValid = true;
    } else {
      isValid = !isDone();
    }
  }
}

void runApp() {
  while (true) {
    var action = inputHandler(
        outputText:
            'Choose action: 1 - show balance, 2 - deposit, 3 - withdraw, 4 - exit');
    if (action == '4') {
      break;
    } else {
      performAction(action);
    }
  }
}

void performAction(String action) {
  switch (action) {
    case '1':
      showBalance();
      break;
    case '2':
      deposit();
      showBalance();
      break;
    case '3':
      withDraw();
      showBalance();
      break;
  }
}

void showBalance() {
  print('Your balance: ${users['balance']}');
}

void deposit() {
  users['balance'] += int.parse(inputHandler(outputText: 'Enter amount: '));
}

void withDraw() {
  users['balance'] -= int.parse(inputHandler(outputText: 'Enter amount: '));
}

bool isDone() {
  return inputHandler(outputText: 'try again? yes/no').toLowerCase() == 'yes'
      ? true
      : false;
}

String inputHandler({required String outputText}) {
  stdout.write(outputText);
  return stdin.readLineSync() as String;
}
