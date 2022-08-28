class Pokemon {
  String pokedex;
  String name;
  List<String> type;
  String caughtLocation;
  String imageURL;

  Pokemon(
      this.pokedex, this.name, this.type, this.caughtLocation, this.imageURL);

  static List<Pokemon> pokemonEntries1 = [];
  static List<Pokemon> pokemonEntries = [
    Pokemon('001', 'Bulbasaur', ['Grass', 'Poison'], 'Home', 'assets/001.png'),
    Pokemon('002', 'Ivysaur', ['Grass', 'Poison'], 'Home', 'assets/002.png'),
    Pokemon('003', 'Venusaur', ['Grass', 'Poison'], 'Home', 'assets/003.png'),
    Pokemon('004', 'Charmander', ['Water', 'Ground', 'Rock'], 'Park',
        'assets/004.png'),
    Pokemon('005', 'Chameleon', ['Fire'], 'Park', 'assets/005.png'),
    Pokemon('006', 'Charizard', ['Fire', 'Flying'], 'Tree', 'assets/006.png'),
  ];
}
