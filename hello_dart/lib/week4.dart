import 'pokemon.dart';

/// Assignment 1.1
/// Explain in your words Nullable vs Non-Nullable types and
/// what are null aware operators. (Comment the answer in the class file).
/// Ans 1.1
/// Non-Nullable Type: In Dart Safe nullability was introduced.
/// That means,   Null is no longer a subtype of available types
/// like int, num, String, etc. No type except the special Null class
///  permits the value null. Dart has made all types non-nullable by default.
/// So, If you have a variable of type String, it will always contain a string.
/// Nullable Types: To allow a type to accept any value, or the value null,
/// dart provides a nullable type by appending ? at the end of the underlying
///  base type. So String becomes String?.  It can now accept all String Values
///  and also the value null.
/// Under the hood, this is essentially defining a union of the underlying type
///  and the Null type. So String? would be a shorthand for String|Null if
///  Dart had full-featured union types.
///Null Aware Operators:
/// Null-Aware operators can help you handle potentially null values.
/// Here they are in brief:
/// If-null operator (??)
/// Null-aware assignment operator (??=)
/// Null-aware access operator (?.)
/// Null-aware method invocation operator (?.)
/// Null assertion operator (!)
/// Null-aware cascade operator (?..)
/// Null-aware index operator (?[])
/// Null-aware spread operator (...?)

///  Assignment 1.2
///  a function which takes 3 Parameters: the first name of type
///  String (required parameter), surname of type String(optional parameter),
///  and the third parameter is an optional bool parameter
///  called isSurnameAtStart. This function will print the first name
///  and surname in the console. As follow:
///  The name of the person is first name surname.
///
void printName(String firstName, [String? surname, bool? isSurnameAtStart]) {
  isSurnameAtStart ??= false; //by default surname is at end
  surname ??= ''; //make surname as empty string
  final fullName =
      isSurnameAtStart ? '$surname $firstName' : '$firstName $surname';
  print('The name of the person is $fullName');
}

/// Assignment 2.1.
/// Use Collection for method on the list to add the name of pokemon
/// in a new list with  Uppercase name.
/// Use sort and arrange them in alphabetical order

void sortAndCapitalizePokemons() {
  const pokemons = [
    'bulbasaur',
    'squirtle',
    'charmander',
    'caterpie',
    'metapod',
    'butterfree',
    'weedle',
    'kakuan',
    'beedrill'
  ];
  final capPokemons = [];
  for (final pokemon in pokemons) {
    capPokemons.add(pokemon.toUpperCase());
  }
  capPokemons.sort();
  print('Capitalised and Sorted Pokemons: $capPokemons');
}

/// Assignment 2.2
/// Create a list of MapStrings which contains pokemon,
/// their types and their speed
/// Use the where method to filter the pokemon as per their types.
/// Create lists like firePokemons, waterPokemons, grassPokemons.
/// Make sure every pokemon is sorted.
//enum PokemonType { Grass, Water, Fire, Fly, Electric }

void categorizePokemons() {
  //Loop through Pokemon Types
  //Get all pokemons of that type
  // store them in a map of that type
  //then sort those on name
  final pokemonCateg = {};
  for (final type in PokemonType.values) {
    final sType = type.toString().split('.').last;
    pokemonCateg[sType] =
        pokemonMap.where((pokemon) => pokemon['type'] == type).toList();
    pokemonCateg[sType].sort((pokemon1, pokemon2) =>
        pokemon1['name'].toString().compareTo(pokemon2['name'].toString()));
  }

  for (final entry in pokemonCateg.entries) {
    if (entry.value.length > 0) {
      print('Pokemons of type ${entry.key}');
      print(entry.value);
    }
  }
}
