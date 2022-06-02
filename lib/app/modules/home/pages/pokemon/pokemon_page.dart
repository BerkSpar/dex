import 'package:dex/app/shared/models/pokemon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pokemon_controller.dart';

class PokemonPage extends StatefulWidget {
  final Pokemon pokemon;

  PokemonPage(this.pokemon);

  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  final controller = Modular.get<PokemonController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
