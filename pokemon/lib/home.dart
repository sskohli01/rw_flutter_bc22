import 'package:flutter/material.dart';
import 'pokemon.dart';
import 'pokemon_detail.dart';
import 'pokemon_card.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Pokemon.pokemonEntries.isNotEmpty
            ? PokemonList(context, Pokemon.pokemonEntries)
            : const Text(
                'No Pokemon entries found!!',
                style: TextStyle(color: Colors.black38, fontSize: 24),
              ),
      ),
      appBar: AppBar(
        title: const Text('My Pokemon'),
        actions: [
          IconButton(
              onPressed: () {
                // method to show the search bar
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: CustomSearchDelegate());
              },
              icon: const Icon(Icons.search))
        ],
      ),
    );
  }
}

@override
Widget? PokemonList(BuildContext context, myPokemon) {
  return ListView.builder(
    itemCount: myPokemon.length,
    itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PokemonDetail(pokemon: myPokemon[index]);
              },
            ),
          );
        },
        child: buildPokemonCard(myPokemon[index]),
      );
    },
  );
}

class CustomSearchDelegate extends SearchDelegate {
// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    final matchQuery = [];
    for (final pokemon in Pokemon.pokemonEntries) {
      var pokemonTypeFound = false;

      pokemon.strTypes().split(', ').forEach((pType) {
        if (pType.toLowerCase().contains(query.toLowerCase())) {
          pokemonTypeFound = true;
        }
      });
      if (pokemon.name.toLowerCase().contains(query.toLowerCase()) ||
          pokemonTypeFound == true) {
        matchQuery.add(pokemon);
      }
    }
    return PokemonList(context, matchQuery)!;
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    final matchQuery = [];
    for (final pokemon in Pokemon.pokemonEntries) {
      var pokemonTypeFound = false;
      pokemon.strTypes().split(', ').forEach((pType) {
        if (pType.toLowerCase().contains(query.toLowerCase())) {
          pokemonTypeFound = true;
        }
      });
      if (pokemon.name.toLowerCase().contains(query.toLowerCase()) ||
          pokemonTypeFound == true) {
        matchQuery.add(pokemon);
      }
    }
    return PokemonList(context, matchQuery)!;
  }
}
