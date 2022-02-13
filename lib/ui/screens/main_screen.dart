import 'package:flutter/material.dart';
import 'package:pokemon/ui/pages/pokemon_page.dart';
import 'package:pokemon/ui/pages/pokemon_params_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PokemonPage())), child: const Text("Pokemon 1")),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PokemonParamsPage())), child: const Text("Pokemon 2")),
          ],
        ),
      ),
    );
  }
}
