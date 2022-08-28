import 'package:flutter/material.dart';
import 'pokemon.dart';

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
