enum PokemonType { Grass, Poison, Water, Ground, Rock, Fire, Flying }

var favePokemons = {};

class Pokemon {
  String pokedex;
  String name;
  List<PokemonType> type;
  String caughtLocation;
  String imageURL;

  Pokemon(
      this.pokedex, this.name, this.type, this.caughtLocation, this.imageURL);

  //converts PokemonType to String
  String strTypes() {
    final sTypes = <String>[];
    for (final pType in type) {
      sTypes.add(pType.toString().split('.')[1]);
    }
    return sTypes.join(', ');
  }

  static List<Pokemon> pokemonEntries = generatePokemonList();
  static List<Pokemon> generatePokemonList() {
    return [
      Pokemon('001', 'Bulbasaur', [PokemonType.Grass, PokemonType.Poison],
          'Home', 'assets/001.png'),
      Pokemon('002', 'Ivysaur', [PokemonType.Grass, PokemonType.Poison], 'Home',
          'assets/002.png'),
      Pokemon('003', 'Venusaur', [PokemonType.Grass, PokemonType.Poison],
          'Home', 'assets/003.png'),
      Pokemon(
          '004',
          'Charmander',
          [PokemonType.Water, PokemonType.Ground, PokemonType.Rock],
          'Park',
          'assets/004.png'),
      Pokemon('005', 'Chameleon', [PokemonType.Fire], 'Park', 'assets/005.png'),
      Pokemon('006', 'Charizard', [PokemonType.Fire, PokemonType.Flying],
          'Tree', 'assets/006.png'),
    ];
  }

  static List<Pokemon> favePokemonEntries() {
    final lFavePokemon = <Pokemon>[];
    for (final pokemon in generatePokemonList()) {
      if (favePokemons.containsKey(pokemon.name)) {
        lFavePokemon.add(pokemon);
      }
    }
    return lFavePokemon;
  }
}
