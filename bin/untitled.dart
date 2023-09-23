import 'package:untitled/untitled.dart' as first_dart;
import 'dart:io';

void main(List<String> arguments) {
  // int one = 1; //= var one =1
  // int two = 2; // = var two =2
  // print('the result is : $one');
  //print('the result is : ${one.floor()+ two}');
  //stdout.write(one+two);

  // var one = '1';
  // var two = '2';
  // print('the result is : ${int.parse(one)+ int.parse(two)}');

  // print('Enter your name: ');
  // var name = stdin.readLineSync();
  // print('Welcome to board $name');

  // print('Enter the first number: ');
  // var one = stdin.readLineSync() as String;
  // print('Enter the second number: ');
  // var two = stdin.readLineSync() as String;
  // print('The sum is: ${(int.parse(one)+ int.parse(two))}');

  // print(calculate(30,50));

  // stdout.write('Enter the first number: ');
  // var firstIn = int.parse(stdin.readLineSync() as String);
  // stdout.write('Enter the second  number: ');
  // var secondIn = int.parse(stdin.readLineSync() as String);
  // stdout.write('Enter operation(+,-,*,/): ');
  // var operIn = stdin.readLineSync() as String;
  // print(calculate(oper:operIn, first:firstIn, second: secondIn));

  //Bank
  runApp();
}

void runApp() {
  int balance = 1000;
  print("Welcome to our bank!");
  stdout.writeln('Choose action (1 - balance, 2 - deposit, 3 - withdraw, 4 - quit): ');
  int chosenNum = int.parse(stdin.readLineSync()!);
  switch (chosenNum) {
    case 1:
      showBalance(balance);
    case 2:
      stdout.writeln("Enter amount: ");
      var depositSum = stdin.readLineSync() as String;
      balance = deposit(depositSum, balance);
      showBalance(balance);
    case 3:
      stdout.writeln("Enter amount: ");
      var depositSum = stdin.readLineSync() as String;
      balance = withdraw(depositSum, balance);
      showBalance(balance);
    case 4:
      break;
  }
}

void showBalance(int balance) {
  print("Your balance is : $balance");
}

int deposit(var depositSum, int balance) {
  return balance + int.parse(depositSum);
}

int withdraw(var depositSum, int balance) {
  return balance - int.parse(depositSum);
}

// int calculate({int first = 0, int  second = 0,String oper = ''}){
//   int result = 0;
//   switch(oper){
//     case '+':
//       result = first + second;
//       break;
//     case '-':
//       result = first - second;
//       break;
//     case '*':
//       result = first * second;
//     case '/':
//       result = first ~/ second;
//   }
//   return result;
// }
