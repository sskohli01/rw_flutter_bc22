import 'package:hello_dart/book_challenges.dart' as hello_dart;
import 'package:hello_dart/string_extension.dart';
import 'package:hello_dart/week3_sarah_food.dart';
import 'package:hello_dart/week3_pokemon_fight.dart';
import 'package:hello_dart/week4.dart';
import 'package:hello_dart/week4_abstract.dart';
import 'package:hello_dart/week4_pokemon_sort.dart';

enum Assignments { week1, week2, week3, week4 }

void main() {
  print('Hello from main:');
  const currentAssignment = Assignments.week4;
  switch (currentAssignment) {
    case Assignments.week4:
      printAssignmentSeparator(4, 'Assignment 1.2');
      //assignment 1.2
      printName('San');
      printName('San', 'Man');
      printName('San', 'Man', true);
      printName('San', 'Man', false);
      //assignment 2.1
      printAssignmentSeparator(
          4, 'Assignment 2.1: Sort and Capitalize Pokemons');
      sortAndCapitalizePokemons();
      //assignment 2.2
      printAssignmentSeparator(4, 'Assignment 2.2: Categorize Pokemons');
      categorizePokemons();
      //assignment 3.1
      printAssignmentSeparator(4, 'Assignment 3.1: Abstract Classes');
      final bike = Bike();
      bike.start();
      bike.accelerate();
      bike.brake();
      bike.stop();
      final scooter = Scooter();
      scooter.start();
      scooter.accelerate();
      scooter.brake();
      scooter.stop();
      final car = Car();
      car.start();
      car.accelerate();
      car.brake();
      car.stop();
      //assignment 3.2
      printAssignmentSeparator(4, 'Assignment 3.2: String Extension');
      print('flutter is awesome!'.firstUpper());
      //assignment 3.3
      printAssignmentSeparator(4, 'Assignment 3.3: Comparable');
      pokemonSort();
      break;
    case Assignments.week3:
      sarahFoodJournal();
      startFight();
      break;
    case Assignments.week2:
      hello_dart.week2Assignment1();
      hello_dart.week2Assignment2(45);
      hello_dart.week2Assignment3();
      break;
    case Assignments.week1:
      /*hello_dart.challenge1();
    hello_dart.challenge2();
    hello_dart.challenge3();
    hello_dart.challenge4();*/
      hello_dart.challenge5();
      break;
  }
}

void printAssignmentSeparator(int week, String assignment) {
  print(
      '\n====================================================================');
  print('''Flutter Bootcamp: Week $week: $assignment''');
  print(
      '======================================================================');
}
