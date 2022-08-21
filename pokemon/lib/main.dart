import 'package:flutter/material.dart';
import 'package:pokemon/pokemon_detail.dart';

import 'pokemon.dart';

void main() {
  runApp(const MyPokemon());
}

class MyPokemon extends StatelessWidget {
  const MyPokemon({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 1 Pokemon',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Pokemon.pokemonEntries.isNotEmpty
              ? ListView.builder(
                  itemCount: Pokemon.pokemonEntries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PokemonDetail(
                                  pokemon: Pokemon.pokemonEntries[index]);
                            },
                          ),
                        );
                      },
                      child: buildPokemonCard(Pokemon.pokemonEntries[index]),
                    );
                  },
                )
              : const Text(
                  "No Pokemon entries found!!",
                  style: TextStyle(color: Colors.black38, fontSize: 24),
                ),
        ),
      ),
      appBar: AppBar(title: const Text('My Pokemon')),
    );
  }
}

Widget buildPokemonCard(Pokemon pokemon) {
  return Card(
    // 1
    elevation: 2.0,
    // 2
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    // 3
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      // 4
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 350,
            width: double.infinity,
            child: Image(
              image: AssetImage(pokemon.imageURL),
            ),
          ),
          // 5
          const SizedBox(
            height: 8,
          ),
          // 6
          Text(
            pokemon.name,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'Palatino',
            ),
          ),
          // 5
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    ),
  );
}
