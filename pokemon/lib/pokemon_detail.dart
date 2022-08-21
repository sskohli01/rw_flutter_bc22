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
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
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
      )),
    );
  }
}

Widget buildPokemonDetailCard(Pokemon pokemon) {
  return Card(
      color: Colors.lightBlueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Expanded(
        child: CustomScrollView(
          primary: false,
          shrinkWrap: true,
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 2,
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
                      style: TextStyle(
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
                      style: TextStyle(
                        fontFamily: 'Flexo-Medium',
                        fontSize: 20,
                      ),
                    ),
                  ]),
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
                      style: TextStyle(
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
                      style: TextStyle(
                        fontFamily: 'Flexo-Medium',
                        fontSize: 20,
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ));
}
