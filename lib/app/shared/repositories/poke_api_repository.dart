import 'dart:async';
import 'package:dex/app/shared/models/pokemon.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class PokeApiRepository extends Disposable {
  final DioForNative _client;
  Completer<Box> completer = Completer<Box>();

  PokeApiRepository(this._client) {
    _init();
  }

  _init() async {
    final directory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    final box = await Hive.openBox('pokemon');
    if (!completer.isCompleted) completer.complete(box);
  }

  int _offset = 0;
  int _limit = 20;

  Future<List<Pokemon>> getPokemons({bool initial = false}) async {
    if (initial) _offset = 0;

    List<Pokemon> list = <Pokemon>[];

    for (int i = _offset; i < _limit + _offset; i++) {
      Pokemon pokemon = await _getCachedPokemon(i + 1);

      if (pokemon == null) {
        pokemon = await _getPokemon(i + 1);
      }

      if (pokemon != null) {
        list.add(pokemon);
      }
    }

    _offset += _limit;

    return list;
  }

  Future<Pokemon> _getCachedPokemon(int id) async {
    final box = await completer.future;
    final pokemon = box.get(id);

    if (pokemon != null) {
      return Pokemon.fromJson(pokemon);
    }

    return null;
  }

  _cachePokemon(Pokemon pokemon) async {
    final box = await completer.future;
    box.put(pokemon.id, pokemon.toJson());
  }

  Future<Pokemon> _getPokemon(int id) async {
    final result = await _client.get('https://pokeapi.co/api/v2/pokemon/$id/');
    final pokemon = Pokemon.fromJson(result.data);

    _cachePokemon(pokemon);

    return pokemon;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
