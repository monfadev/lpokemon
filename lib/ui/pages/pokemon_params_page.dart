import 'package:flutter/material.dart';

import '../../core/https/pokemon_http.dart';
import '../../core/models/pokemon.dart';

class PokemonParamsPage extends StatefulWidget {
  const PokemonParamsPage({Key? key}) : super(key: key);

  @override
  State<PokemonParamsPage> createState() => _PokemonParamsPageState();
}

class _PokemonParamsPageState extends State<PokemonParamsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon 2"),
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: PokemonHttp.listOfPokemon2(0),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData && snapshot.hasError) {
            return const Center(child: Text("Items not found"));
          }

          return PokemonList(snapshot: snapshot.data);
        },
      ),
    );
  }
}

class PokemonList extends StatefulWidget {
  final dynamic snapshot;
  const PokemonList({Key? key, required this.snapshot}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  List<Pokemon> _items = [];
  int offset = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _items = widget.snapshot;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollEndNotification>(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _items.length + 1,
        itemBuilder: (context, index) {
          if (index == _items.length) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListTile(
            title: Text("$index ${_items[index].name}"),
          );
        },
      ),
      onNotification: (notification) {
        if (notification.metrics.pixels == _scrollController.position.maxScrollExtent) {
          offset = offset + 20;
          PokemonHttp.listOfPokemon2(offset).then((value) {
            setState(() {
              _items.addAll(value);
            });
          });
        }
        return true;
      },
    );
  }
}
