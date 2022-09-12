import 'pokemon.dart';

/// Assignment 3.3
/// Create a class named Pokemon and add properties
/// -  name, type and speed.
/// Implement Comparable that you have learned in the chapter Advance Classes
///  on Pokemon. Make a  pokemon list with data given in assignment 2.2.
///  Call the sort on the list and sort them by speed.

void pokemonSort() {
  final listPokemon = <Pokemon>[];
  for (final entry in pokemonMap) {
    final pokemon = Pokemon(
        name: entry['name'].toString(),
        type: entry['type'] as PokemonType,
        speed: (entry['speed'] as int).toDouble());
    listPokemon.add(pokemon);
  }
  listPokemon.sort();
  print('Sorted Pokemons on speed: ');
  listPokemon.forEach((pokemon) => print('${pokemon.name} - ${pokemon.speed}'));
}
