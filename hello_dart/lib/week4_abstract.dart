/// Assignment 3.1
/// Create an abstract class named Vehicle which has 4 abstract functions
///  -  start, stop, accelerate, and brake. Create 3 concrete classes -
/// bike, scooter, and car which extend the vehicle abstract class.
///  Add a print statement inside these functions stating the state
///  of the function. Run the function in the main.
///
abstract class Vehicle {
  void start();
  void stop();
  void accelerate();
  void brake();
}

class Bike extends Vehicle {
  @override
  void accelerate() {
    print('Bike is accelerating!');
  }

  @override
  void brake() {
    print('Bike is braking!');
  }

  @override
  void start() {
    print('Bike is starting!');
  }

  @override
  void stop() {
    print('Bike is stopping!');
  }
}

class Scooter extends Vehicle {
  @override
  void accelerate() {
    print('Scooter is accelerating!');
  }

  @override
  void brake() {
    print('Scooter is braking!');
  }

  @override
  void start() {
    print('Scooter is starting!');
  }

  @override
  void stop() {
    print('Scooter is stopping!');
  }
}

class Car extends Vehicle {
  @override
  void accelerate() {
    print('Car is accelerating!');
  }

  @override
  void brake() {
    print('Car is braking!');
  }

  @override
  void start() {
    print('Car is starting!');
  }

  @override
  void stop() {
    print('Car is stopping!');
  }
}
