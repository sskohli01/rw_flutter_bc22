import 'package:flutter/material.dart';
import 'pokemon.dart';

class PokemonCard extends StatefulWidget {
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;
  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  @override
  Widget build(BuildContext context) {
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
            /*Row(children: [
              const SizedBox(
                width: 30,
              ),
              IconButton(
                icon: favePokemons.containsKey(widget.pokemon.name)
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_outline),
                tooltip: 'Add to favorites',
                onPressed: () {
                  setState(() {
                    if (favePokemons.containsKey(widget.pokemon.name)) {
                      favePokemons.remove(widget.pokemon.name);
                    } else {
                      favePokemons[widget.pokemon.name] = 1;
                    }
                  });
                },
              ),
            ]),*/
            SizedBox(
              height: 350,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.pokemon.imageURL),
              ),
            ),
            // 5
            const SizedBox(
              height: 8,
            ),
            // 6
            Text(
              widget.pokemon.name,
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
}
