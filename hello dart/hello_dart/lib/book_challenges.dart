import 'dart:math';
import 'package:vector_math/vector_math.dart';

///Flutter Bootcamp: Week 2: Assignment 3
/// method name week2Assignment3
/// params: none
/// return value: void
/// value for the expression of String concatenation and interpolation
void week2Assignment3() {
  print(
      "Flutter Bootcamp: Week 2: Assignment 3: String concatenation and interpolation");
  num age = 13;
  num zero = 0;
  String sHome = 'home';
  String sGirls = 'girls';
  var sBlue = 'Blue';
  var sJack = 'Jack';
  var sOld = 'old';
  var myStory = "Dead Girl\n";
  myStory += '''
Outside the funeral $sHome, I heard a boy say that she had fallen off the back of her boyfriend’s motorcycle. Broken her neck. She never knew what hit her, he said. I was $age. 
The dead girl had been a junior in high school.
The line to see her snaked around the building. Boys with long hair, wearing ties they’d borrowed from their fathers, and $sGirls with thick $sBlue eyeshadow smoked cigarettes in the parking lot. 
Someone passed a bottle of $sJack. There were $zero adults there, just very $sOld kids.
She almost looked like she was sleeping, except that she was too still. There was a puffiness to her face that didn’t seem quite right. 
They had dressed her for the prom; the crinoline sleeves of her gown like poofs of pink cotton candy. 
Some kids prayed, but I couldn’t. I just stared at the roses in her corsage.''';

  print(myStory);
}

///Flutter Bootcamp: Week 2: Assignment 2
/// method name week2Assignment2
/// params: int degrees
/// return value: void
/// value for the expression of sin2x + cos2x
void week2Assignment2(double degrees) {
  print(
      "Flutter Bootcamp: Week 2: Assignment 2: value for the expression of sin2x + cos2x");
  var radian = radians(degrees);
  print("degree = $degrees, radian value = $radian");
  var sinX = sin(radian);
  var cosX = cos(radian);
  var result = pow(sinX, 2) + pow(cosX, 2);

  print(
      "The value of the expression sin^2($radian) +  cos^2($radian) is $result and its run type value is ${result.runtimeType}");

  result += sinX;
  print(
      "The value of the expression sin^2($radian) +  cos^2($radian) + sin($radian) is $result and its run type value is ${result.runtimeType}");
}

///Flutter Bootcamp: Week 2: Assignment 1
/// method name week2Assignment1
/// params: none
/// return value: void
/// Calls a method challenge5, finds the max of the 2 roots and displays the max and integer values of the 2 roots
void week2Assignment1() {
  print("Flutter Bootcamp: Week 2: Assignment 1: ");
  var roots = challenge5();
  if (roots.length == 2) {
    var max = roots[0] >= roots[1] ? roots[0] : roots[1];
    print(
        "The first root of the equation is ${roots[0]} and its integer value is ${roots[0].toInt()}");
    print(
        "The second root of the equation is ${roots[1]} and its integer value is ${roots[1].toInt()}");
    print("The largest root has the value equal to $max");
  } else {
    print(
        "Error in function challenge5: $roots: Length: {$roots.length} expecting Length: 2");
  }
}

///Dart Apprentice Book : Chapter 2: Challenge 5
/// method name challenge5
/// params: none
/// return value: void
/// shows the results of mathematical operators: sqrt
List<double> challenge5() {
  print("Dart Apprentice: Chapter 2: Challenge 5: Square Root: ");
  var a = 5;
  var b = 10;
  var c = 4;
  var bPow2 = pow(b, 2);
  var sqrRoot = sqrt(bPow2 - 4 * a * c);
  print(
      "bPow2 = pow($b, 2) = $bPow2 and sqrRoot = sqrt($bPow2 - 4 * $a * $c) = $sqrRoot");
  var root1 = (-b + sqrRoot) / (2 * a);
  var root2 = (-b - sqrRoot) / (2 * a);
  print("x = (-b ± sqrt(b² - 4⋅a⋅c)) / (2⋅a) = root1 = $root1, root2 = $root2");
  return [root1, root2];
}

///Dart Apprentice Book : Chapter 2: Challenge 4
/// method name challenge4
/// params: none
/// return value: void
/// shows the results of mathematical operators: average
void challenge4() {
  print("Dart Apprentice: Chapter 2: Challenge 4: Averages: ");
  const double rating1 = 46;
  const double rating2 = 45;
  const double rating3 = 50;
  const average = (rating1 + rating2 + rating3) / 3;
  print("average = ($rating1 + $rating2 + $rating3) / 3  = $average");
}

///Dart Apprentice Book : Chapter 2: Challenge 3
/// method name challenge3
/// params: none
/// return value: void
/// shows the results of mathematical operators and their precedence
void challenge3() {
  print("Dart Apprentice: Chapter 2: Challenge 3: Mathematical Operators: ");
  const x = 46;
  const y = 10;
  const answer1 = (x * 100) + y;
  const answer2 = (x * 100) + (y * 100);
  const answer3 = (x * 100) + (y / 10);
  print("x=$x, y=$y, ans1: $answer1 ans2: $answer2 ans3: $answer3 ");
}

///Dart Apprentice Book : Chapter 2: Challenge 2
/// method name challenge2
/// params: none
/// return value: void
/// tests the use of var
void challenge2() {
  print("Dart Apprentice: Chapter 2: Challenge 2: Use of var");
  var age = 16;
  print(age);
  age = 30;
  print(age);
}

///Dart Apprentice Book : Chapter 2: Challenge 1
/// method name challenge1
/// params: none
/// return value: void
/// prints some variables
void challenge1() {
  int myAge = 35;
  int numDogs = 0;
  numDogs++;
  print(
      "Dart Apprentice: Chapter 2: Challenge 1: myAge = $myAge numDogs = $numDogs");
}
