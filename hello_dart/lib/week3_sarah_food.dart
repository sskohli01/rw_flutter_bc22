//Assignment 1 - A girl who knows what she wants
// When it is rainy on Thursdays or when it is cloudy on weekends,
// Sarah likes to order Thai food for dinner.
//  Otherwise she just likes to make a ham sandwich at home.
//  Except on Tuesdays Sarah always orders pizza regardless of the weather.
//  Oh and if there’s ever a thunderstorm Sarah simply must eat tacos
// (except on Tuesdays, obviously).

import 'dart:math';

// An Enum for storing the different types of weather
enum WeatherToday { cloudy, thunderstorm, rainy, sunny }

// An Enum for storing the days of a week
enum DayOfTheWeek {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday
}

//for a particular DayOfTheWeek enum,
//returns the string version of the day
String dayString(DayOfTheWeek day) {
  switch (day) {
    case DayOfTheWeek.sunday:
      return 'Sunday';
    case DayOfTheWeek.monday:
      return 'Monday';
    case DayOfTheWeek.tuesday:
      return 'Tuesday';
    case DayOfTheWeek.wednesday:
      return 'Wednesday';
    case DayOfTheWeek.thursday:
      return 'Thursday';
    case DayOfTheWeek.friday:
      return 'Friday';
    case DayOfTheWeek.saturday:
      return 'Saturday';
  }
}

//for a particular Weather enum,
//returns the string version of the weather
String weatherString(WeatherToday weather) {
  switch (weather) {
    case WeatherToday.rainy:
      return 'rainy';
    case WeatherToday.cloudy:
      return 'cloudy';
    case WeatherToday.sunny:
      return 'sunny';
    case WeatherToday.thunderstorm:
      return 'a thunderstorm';
  }
}

///Function: printFoodChoiceFor - prints what Sarah on a particular day
/// params: takes in the day of the week and the weather
/// returns: void
void printFoodChoiceFor(
    {required DayOfTheWeek day, required WeatherToday weather}) {
  // on Tuesdays Sarah always orders pizza regardless of the weather.
  if (day == DayOfTheWeek.tuesday) {
    print(
        '''${dayString(day)} is ${weatherString(weather)}, so Sarah ate Pizza.''');
  }
  // When it is rainy on Thursdays, Sarah likes to order Thai food for dinner
  else if (day == DayOfTheWeek.thursday && weather == WeatherToday.rainy) {
    print(
        '''${dayString(day)} is ${weatherString(weather)}, so Sarah ate Thai food.''');
  }
  //when it is cloudy on weekends, Sarah likes to order Thai food for dinner
  else if (weather == WeatherToday.cloudy &&
      (day == DayOfTheWeek.saturday || day == DayOfTheWeek.sunday)) {
    print(
        '''${dayString(day)} is ${weatherString(weather)}, so Sarah ate Thai food.''');
  }
  // on Tuesdays Sarah always orders pizza regardless of the weather.
  else if (weather == WeatherToday.thunderstorm) {
    print(
        '''${dayString(day)} is ${weatherString(weather)}, so Sarah ate tacos.''');
  }
  // Otherwise she just likes to make a ham sandwich at home
  else {
    print(
        '''${dayString(day)} is ${weatherString(weather)}, so Sarah made a ham sandwich.''');
  }
}

///Function: sarahFoodJournal - foreach day and weather prints what Sarah ate
/// params: none
/// returns: void
void sarahFoodJournal() {
  print(
      '\n====================================================================');
  print('''Flutter Bootcamp: Week 3: Assignment 1: Sarah's food journal''');
  print(
      '======================================================================');
  for (final day in DayOfTheWeek.values) {
    final random = Random();
    final weatherIndex = random.nextInt(WeatherToday.values.length);
    printFoodChoiceFor(day: day, weather: WeatherToday.values[weatherIndex]);
  }
}
