import 'dart:io';

Map<String, double> stock = {
  'coffee': 100,
  'sugar': 60,
  'milk': 200,
  'water': 1200
};
Map<String, Map<String, double>> ingredients = {
  'Latte': {'coffee': 50, 'sugar': 20, 'milk': 40, 'water': 80},
  'Espresso': {'coffee': 40, 'sugar': 10, 'milk': 50, 'water': 100},
  'Americano': {'coffee': 30, 'sugar': 15, 'milk': 60, 'water': 90},
  'Capuchin': {'coffee': 60, 'sugar': 10, 'milk': 30, 'water': 70},
};

void main(List<String> arguments) {
  runApp();
}

void runApp() {
  print("Welcome to our coffee shop!");
  var role = inputHandler(output: 'Choose a role: (1 - client, 2 - admin)');
  switch (role) {
    case '1':
      coffeeMaker();
    case '2':
      coffeeFiller();
  }
}

String inputHandler({required String output}) {
  stdout.writeln(output);
  String chosenNum = stdin.readLineSync() as String;
  return chosenNum;
}

void coffeeMaker() {
  while (true) {
    var coffee = inputHandler(
        output:
            'Choose a coffee: (1 - Latte, 2 - Espresso, 3 - Americano, 4 - Capuchin): ');
    var withSugar = inputHandler(output: 'Do you want with sugar?: (yes, no)');
    switch (coffee) {
      case '1':
        if (stock['coffee']! - ingredients['Latte']!['coffee']! > 0 &&
            stock['milk']! - ingredients['Latte']!['milk']! > 0 &&
            stock['water']! - ingredients['Latte']!['water']! > 0) {
          if (withSugar == 'yes' &&
              stock['sugar']! - ingredients['Latte']!['sugar']! > 0) {
            stock['sugar'] =
                (stock['sugar']! - ingredients['Latte']!['sugar']!);
          }
          stock['coffee'] =
              (stock['coffee']! - ingredients['Latte']!['coffee']!);
          stock['milk'] = (stock['milk']! - ingredients['Latte']!['milk']!);
          stock['water'] = (stock['water']! - ingredients['Latte']!['water']!);
        } else {
          print('The ingredients are not enough!');
          break;
        }
      case '2':
        if (stock['coffee']! - ingredients['Espresso']!['coffee']! > 0 &&
            stock['milk']! - ingredients['Espresso']!['milk']! > 0 &&
            stock['water']! - ingredients['Espresso']!['water']! > 0) {
          if (withSugar == 'yes' &&
              stock['sugar']! - ingredients['Espresso']!['sugar']! > 0) {
            stock['sugar'] =
                (stock['sugar']! - ingredients['Espresso']!['sugar']!);
          }
          stock['coffee'] =
              (stock['coffee']! - ingredients['Espresso']!['coffee']!);
          stock['milk'] = (stock['milk']! - ingredients['Espresso']!['milk']!);
          stock['water'] =
              (stock['water']! - ingredients['Espresso']!['water']!);
        } else {
          print('The ingredients are not enough!');
          break;
        }
      case '3':
        if (stock['coffee']! - ingredients['Americano']!['coffee']! > 0 &&
            stock['milk']! - ingredients['Americano']!['milk']! > 0 &&
            stock['water']! - ingredients['Americano']!['water']! > 0) {
          if (withSugar == 'yes' &&
              stock['sugar']! - ingredients['Americano']!['sugar']! > 0) {
            stock['sugar'] =
                (stock['sugar']! - ingredients['Americano']!['sugar']!);
          }
          stock['coffee'] =
              (stock['coffee']! - ingredients['Americano']!['coffee']!);
          stock['milk'] = (stock['milk']! - ingredients['Americano']!['milk']!);
          stock['water'] =
              (stock['water']! - ingredients['Americano']!['water']!);
        } else {
          print('The ingredients are not enough!');
          break;
        }
      case '4':
        if (stock['coffee']! - ingredients['Capuchin']!['coffee']! > 0 &&
            stock['milk']! - ingredients['Capuchin']!['milk']! > 0 &&
            stock['water']! - ingredients['Capuchin']!['water']! > 0) {
          if (withSugar == 'yes' &&
              stock['sugar']! - ingredients['Capuchin']!['sugar']! > 0) {
            stock['sugar'] =
                (stock['sugar']! - ingredients['Capuchin']!['sugar']!);
          }
          stock['coffee'] =
              (stock['coffee']! - ingredients['Capuchin']!['coffee']!);
          stock['milk'] = (stock['milk']! - ingredients['Capuchin']!['milk']!);
          stock['water'] =
              (stock['water']! - ingredients['Capuchin']!['water']!);
        } else {
          print('The ingredients are not enough!');
          break;
        }
    }
    print(stock);
  }
}

void coffeeFiller() {
  var fillingIngredient = inputHandler(
      output:
          'What do you want to fill: (1 - coffee, 2 - sugar, 3 - milk, 4 - water)');
  var amount = inputHandler(output: 'Enter amount: ');
  switch (fillingIngredient) {
    case '1':
      stock['coffee'] = stock['coffee']! + double.parse(amount);
    case '2':
      stock['sugar'] = stock['sugar']! + double.parse(amount);
    case '3':
      stock['milk'] = stock['milk']! + double.parse(amount);
    case '4':
      stock['water'] = stock['water']! + double.parse(amount);
  }
  print(stock);

  var askForCoffee =
      inputHandler(output: 'Do you want a cup of coffee, maybe?: (yes, no)');
  switch (askForCoffee) {
    case 'yes':
      coffeeMaker();
    case 'no':
      coffeeFiller(); //recursion
  }
}

//can't initialize with null, so give default value or make it non-null -> required
