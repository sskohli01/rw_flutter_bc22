import 'dart:math';

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

class Pokemon {
  Pokemon({required this.name, required this.type, this.hitPoints = 10});
  final String name;
  final PokemonType type;
  double hitPoints;

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
}

List<Pokemon> createPokemons() {
  final Pokemons = [
    Pokemon(name: 'Charmander', type: PokemonType.Fire),
    Pokemon(name: 'Bulbasaur', type: PokemonType.Grass),
    Pokemon(name: 'Squirtle', type: PokemonType.Water),
  ];
  return Pokemons;
}

//main function which starts the fight between different pokemons
void startFight() {
  print(
      '\n====================================================================');
  print('''Flutter Bootcamp: Week 3: Assignment 2: Pokemon Fight''');
  print(
      '======================================================================');
  final Pokemons = createPokemons();
  final PokemonsCopy = createPokemons();
  final random = Random();
  Pokemon firstPokemon, secondPokemon;
  var bContinue = false;
  do {
    firstPokemon = Pokemons[random.nextInt(Pokemons.length)];
    while (firstPokemon.hitPoints < 0) {
      firstPokemon = Pokemons[random.nextInt(Pokemons.length)];
    }
    secondPokemon = Pokemons[random.nextInt(Pokemons.length)];
    while (secondPokemon.name == firstPokemon.name) {
      secondPokemon = Pokemons[random.nextInt(Pokemons.length)];
    }
    if (secondPokemon.hitPoints == 0) {
      print('${firstPokemon.name} roars with fury!');
    } else {
      print('$firstPokemon attacks $secondPokemon');
    }
    final firstPokemonStrengths = pokemonStrengths[firstPokemon.type];
    if (firstPokemonStrengths?['strong'] == secondPokemon.type) {
      secondPokemon.updatehitPoints(byPoints: -2);
    } else if (firstPokemonStrengths?['weak'] == secondPokemon.type) {
      secondPokemon.updatehitPoints(byPoints: -0.5);
    } else {
      secondPokemon.updatehitPoints(byPoints: -1);
    }
    bContinue = shouldFightContinue(Pokemons);
  } while (bContinue);

  print('A VICTOR EMERGES!');
  print('${Pokemons.first.name} has won the battle.');
  Pokemon.revivePokemon(PokemonsCopy);
}

///function which determines if the pokemons have enough Hitpoints
///left to fight
bool shouldFightContinue(Pokemons) {
  final lostPokemons = <Pokemon>{};
  for (final pokemon in Pokemons) {
    if (pokemon.hitPoints < 0) {
      lostPokemons.add(pokemon);
    }
  }
  lostPokemons.forEach((pokemon) => Pokemons.remove(pokemon));
  if (Pokemons.length <= 1) {
    return false;
  }
  return true;
}
