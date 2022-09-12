import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'pokemon.dart';
import 'pokemon_detail.dart';
import 'pokemon_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var faveIcon = Icons.favorite;
  var screenTitle = '';

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
        title: Text(screenTitle),
        actions: [
          IconButton(
            onPressed: () {
              if (faveIcon == Icons.favorite) {
                if (favePokemons.length > 0) {
                  setState(() {
                    faveIcon = Icons.home;
                    screenTitle = 'Favorite Pokemons';
                    Pokemon.pokemonEntries.clear();
                    final fpe = Pokemon.favePokemonEntries();
                    Pokemon.pokemonEntries.addAll(fpe);
                  });
                } else {
                  showToastMessage(
                      '''Please add any Pokemon to favorite list first!''');
                }
              } else {
                setState(() {
                  faveIcon = Icons.favorite;
                  screenTitle = 'Pokemon - Home';
                  Pokemon.pokemonEntries.clear();
                  Pokemon.pokemonEntries.addAll(Pokemon.generatePokemonList());
                });
              }
            },
            icon: Icon(faveIcon),
          ),
          IconButton(
              onPressed: () {
                // method to show the search bar
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: CustomSearchDelegate());
              },
              icon: const Icon(Icons.search)),
        ],
      ),
    );
  }
}

//create this function, so that, you needn't to configure toast every time
void showToastMessage(String message) {
  Fluttertoast.showToast(
      msg: message, //message to show toast
      toastLength: Toast.LENGTH_LONG, //duration for message to show
      gravity: ToastGravity.CENTER, //where you want to show, top, bottom
      timeInSecForIosWeb: 1, //for iOS only
      //backgroundColor: Colors.red, //background Color for message
      textColor: Colors.white, //message text color
      fontSize: 16.0 //message font size
      );
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
          /*.whenComplete(() {
            setState(() {
              Pokemon.pokemonEntries.clear();
              Pokemon.pokemonEntries.addAll(Pokemon.generatePokemonList());
            });
          });*/
        },
        child: PokemonCard(pokemon: myPokemon[index]),
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
