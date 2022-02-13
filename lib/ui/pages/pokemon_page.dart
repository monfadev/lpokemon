import 'package:flutter/material.dart';

import '../../core/https/pokemon_http.dart';
import '../../core/models/pokemon.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon 1"),
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: PokemonHttp.listOfPokemon(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData && snapshot.hasError) {
            return const Center(child: Text("Items not found"));
          }

          return ListView(
            children: snapshot.data!.map((e) => _items(e)).toList(),
          );
        },
      ),
    );
  }

  Widget _items(Pokemon data) {
    return ListTile(
      title: Text(data.name ?? ""),
    );
  }
}
