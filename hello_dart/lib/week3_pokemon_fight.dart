import 'dart:math';

const pokemonTypes = [
  {
    'name': PokemonType.Normal,
    'immunes': [PokemonType.Ghost],
    'weaknesses': [PokemonType.Rock, PokemonType.Steel],
    'strengths': []
  },
  {
    'name': PokemonType.Fire,
    'immunes': [],
    'weaknesses': [
      PokemonType.Fire,
      PokemonType.Water,
      PokemonType.Rock,
      PokemonType.Dragon
    ],
    'strengths': [
      PokemonType.Grass,
      PokemonType.Ice,
      PokemonType.Bug,
      PokemonType.Steel
    ]
  },
  {
    'name': PokemonType.Water,
    'immunes': [],
    'weaknesses': [PokemonType.Water, PokemonType.Grass, PokemonType.Dragon],
    'strengths': [PokemonType.Fire, PokemonType.Ground, PokemonType.Rock]
  },
  {
    'name': PokemonType.Electric,
    'immunes': [PokemonType.Ground],
    'weaknesses': [PokemonType.Electric, PokemonType.Grass, PokemonType.Dragon],
    'strengths': [PokemonType.Water, PokemonType.Flying]
  },
  {
    'name': PokemonType.Grass,
    'immunes': [],
    'weaknesses': [
      PokemonType.Fire,
      PokemonType.Grass,
      'Poison',
      PokemonType.Flying,
      PokemonType.Bug,
      PokemonType.Dragon,
      PokemonType.Steel
    ],
    'strengths': [PokemonType.Water, PokemonType.Ground, PokemonType.Rock]
  },
  {
    'name': PokemonType.Ice,
    'immunes': [],
    'weaknesses': [
      PokemonType.Fire,
      PokemonType.Water,
      PokemonType.Ice,
      PokemonType.Steel
    ],
    'strengths': [
      PokemonType.Grass,
      PokemonType.Ground,
      PokemonType.Flying,
      PokemonType.Dragon
    ]
  },
];

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
  int hitPoints;

  void updatehitPoints({required int byPoints}) {
    hitPoints += byPoints;
  }

  @override
  String toString() {
    return '$name($hitPoints)';
  }
}

void initFight() {
  final Pokemons = [
    Pokemon(name: 'Charmander', type: PokemonType.Fire),
    Pokemon(name: 'Bulbasaur', type: PokemonType.Grass),
    Pokemon(name: 'Squirtle', type: PokemonType.Water),
  ];
  startFight(Pokemons);
}

void startFight(List<Pokemon> Pokemons) {
  final random = Random();
  Pokemon firstPokemon, secondPokemon;
  var bContinue = false;
  var i = 0;
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

    secondPokemon.updatehitPoints(byPoints: -1);
    bContinue = shouldFightContinue(Pokemons);
    i++;
  } while (bContinue);

  print('A VICTOR EMERGES!');
  print('${Pokemons.first.name} has won the battle.');
}

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
