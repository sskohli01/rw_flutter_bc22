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
enum PokemonType { Grass, Water, Fire, Fly, Electric }

void categorizePokemons() {
  final pokemons = [
    {'name': 'Bulbasaur', 'type': PokemonType.Grass, 'speed': 30},
    {'name': 'Squirtle', 'type': PokemonType.Water, 'speed': 24},
    {'name': 'Charmander', 'type': PokemonType.Fire, 'speed': 40},
    {'name': 'Venusaur', 'type': PokemonType.Grass, 'speed': 40},
    {'name': 'Caterpie', 'type': 'bug', 'speed': 30},
    {'name': 'Pidgey', 'type': PokemonType.Fly, 'speed': 30},
    {'name': 'Pikachu', 'type': PokemonType.Electric, 'speed': 50},
    {'name': 'Raichu', 'type': PokemonType.Electric, 'speed': 60},
    {'name': 'Rattata', 'type': 'normal', 'speed': 40},
    {'name': 'Charmelion', 'type': PokemonType.Fire, 'speed': 40},
    {'name': 'Charizard', 'type': PokemonType.Fire, 'speed': 50},
    {'name': 'Spearow', 'type': PokemonType.Fly, 'speed': 40},
    {'name': 'Oddish', 'type': PokemonType.Grass, 'speed': 20},
    {'name': 'Poliwag', 'type': PokemonType.Water, 'speed': 50},
    {'name': 'Poliwhirl', 'type': PokemonType.Water, 'speed': 50}
  ];

  //Loop through Pokemon Types
  //Get all pokemons of that type
  // store them in a map of that type
  //then sort those on name
  final pokemonCateg = {};
  for (final type in PokemonType.values) {
    final sType = type.toString().split('.').last;
    pokemonCateg[sType] = 
      pokemons.where((pokemon) => pokemon['type'] == type).toList();
    pokemonCateg[sType].sort((pokemon1, pokemon2) =>
      pokemon1['name'].toString().compareTo(pokemon2['name'].toString()));
  }

  for (final entry in pokemonCateg.entries) {
    print('Pokemons of type ${entry.key}');
    print(entry.value);
  }
}
