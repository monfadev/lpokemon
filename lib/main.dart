import 'package:flutter/material.dart';
import 'package:pokemon/ui/screens/main_screen.dart';

void main() {
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokemon',
      home: MainScreen(),
    );
  }
}
