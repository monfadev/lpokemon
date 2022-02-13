import 'package:flutter/material.dart';

import '../../core/https/pokemon_http.dart';
import '../../core/models/pokemon.dart';

class PokemonParamsPage extends StatefulWidget {
  const PokemonParamsPage({Key? key}) : super(key: key);

  @override
  State<PokemonParamsPage> createState() => _PokemonParamsPageState();
}

class _PokemonParamsPageState extends State<PokemonParamsPage> {
  List<Pokemon> _items = [];
  int offset = 0;

  @override
  void initState() {
    super.initState();
    loadItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon 2"),
      ),
      body: NotificationListener<ScrollEndNotification>(
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_items[index].name ?? "Not Available"),
            );
          },
        ),
        onNotification: (notification) {
          offset++;
          PokemonHttp.listOfPokemon2(offset).then((value) {
            setState(() {
              _items.addAll(value);
            });
          });
          return true;
        },
      ),
    );
  }

  void loadItem() async {
    var resp = await PokemonHttp.listOfPokemon2(offset);
    if (resp.isNotEmpty) {
      if (mounted) {
        setState(() {
          _items = resp;
        });
      }
    }
  }
}
