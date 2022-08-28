import 'package:flutter/material.dart';
import 'package:pokemon/pokemon.dart';

class PokemonDetail extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonDetail({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PokemonDetail> createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.name),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            SizedBox(
              height: 350,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.pokemon.imageURL),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildPokemonDetailCard(widget.pokemon)
          ],
        ),
      ),
    );
  }
}

Widget buildPokemonDetailCard(Pokemon pokemon) {
  return Card(
    color: Colors.lightBlueAccent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      shrinkWrap: true,
      children: <Widget>[
        Column(children: [
          const Text('Pokedex No',
              style: TextStyle(
                  fontFamily: 'Flexo-Medium',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(
            height: 15,
          ),
          Text(
            pokemon.pokedex,
            style: const TextStyle(
              fontFamily: 'Flexo-Medium',
              fontSize: 20,
            ),
          ),
        ]),
        Column(children: [
          const Text('Name',
              style: TextStyle(
                  fontFamily: 'Flexo-Medium',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(
            height: 15,
          ),
          Text(
            pokemon.name,
            style: const TextStyle(
              fontFamily: 'Flexo-Medium',
              fontSize: 20,
            ),
          ),
        ]),
        Column(children: [
          const Text('Type',
              style: TextStyle(
                  fontFamily: 'Flexo-Medium',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(
            height: 15,
          ),
          Text(
            pokemon.type.join(', '),
            style: const TextStyle(
              fontFamily: 'Flexo-Medium',
              fontSize: 20,
            ),
          ),
        ]),
        Column(children: [
          const Text('Caught Location',
              style: TextStyle(
                  fontFamily: 'Flexo-Medium',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(
            height: 15,
          ),
          Text(
            pokemon.caughtLocation,
            style: const TextStyle(
              fontFamily: 'Flexo-Medium',
              fontSize: 20,
            ),
          ),
        ]),
      ],
    ),
  );
}
