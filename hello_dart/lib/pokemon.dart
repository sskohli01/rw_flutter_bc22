const pokemonStrengths = {
  PokemonType.Fire: {'strong': PokemonType.Grass, 'weak': PokemonType.Water},
  PokemonType.Water: {'strong': PokemonType.Fire, 'weak': PokemonType.Grass},
  PokemonType.Grass: {'strong': PokemonType.Water, 'weak': PokemonType.Fire},
};

enum PokemonType {
  Normal,
  Grass,
  Electric,
  Water,
  Fire,
  Flying,
  Dragon,
  Rock,
  Ice,
  Steel,
  Bug,
  Ghost,
  Ground
}

class Pokemon implements Comparable<Pokemon> {
  Pokemon(
      {required this.name,
      required this.type,
      this.hitPoints = 10,
      this.speed = 0.0});

  final String name;
  final PokemonType type;
  double hitPoints;
  double speed;
  void updatehitPoints({required double byPoints}) {
    hitPoints += byPoints;
  }

  static void revivePokemon(List<Pokemon> Pokemons) {
    Pokemons.forEach((pokemon) {
      pokemon.hitPoints = 10;
      print('${pokemon.name}  healed up to 10 HP');
    });
  }

  @override
  String toString() {
    return '$name($hitPoints)';
  }

  @override
  int compareTo(Pokemon other) => speed.floor() - other.speed.floor();
}

final pokemonMap = [
  {'name': 'Bulbasaur', 'type': PokemonType.Grass, 'speed': 30},
  {'name': 'Squirtle', 'type': PokemonType.Water, 'speed': 24},
  {'name': 'Charmander', 'type': PokemonType.Fire, 'speed': 40},
  {'name': 'Venusaur', 'type': PokemonType.Grass, 'speed': 40},
  {'name': 'Caterpie', 'type': PokemonType.Bug, 'speed': 30},
  {'name': 'Pidgey', 'type': PokemonType.Flying, 'speed': 30},
  {'name': 'Pikachu', 'type': PokemonType.Electric, 'speed': 50},
  {'name': 'Raichu', 'type': PokemonType.Electric, 'speed': 60},
  {'name': 'Rattata', 'type': PokemonType.Normal, 'speed': 40},
  {'name': 'Charmelion', 'type': PokemonType.Fire, 'speed': 40},
  {'name': 'Charizard', 'type': PokemonType.Fire, 'speed': 50},
  {'name': 'Spearow', 'type': PokemonType.Flying, 'speed': 40},
  {'name': 'Oddish', 'type': PokemonType.Grass, 'speed': 20},
  {'name': 'Poliwag', 'type': PokemonType.Water, 'speed': 50},
  {'name': 'Poliwhirl', 'type': PokemonType.Water, 'speed': 50}
];
