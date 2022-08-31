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
      appBar: AppBar(title: const Text('My Pokemon')),
    );
  }
}
