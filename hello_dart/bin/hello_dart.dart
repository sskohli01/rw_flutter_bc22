import 'package:hello_dart/book_challenges.dart' as hello_dart;
import 'package:hello_dart/week3_sarah_food.dart';
import 'package:hello_dart/week3_pokemon_fight.dart';
import 'package:hello_dart/week4.dart';

enum Assignments {week1, week2, week3, week4}
void main() {
  print('Hello from main:');
  const currentAssignment = Assignments.week4;
  switch(currentAssignment) {
    case Assignments.week4:
      //assignment 1.2
      printName('San');
      printName('San', 'Man');
      printName('San', 'Man', true);
      printName('San', 'Man', false);
      //assignment 2.1
      sortAndCapitalizePokemons();
      //assignment 2.2
      categorizePokemons();
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
