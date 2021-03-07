// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$pokemonsAtom = Atom(name: '_HomeControllerBase.pokemons');

  @override
  ObservableList<Pokemon> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(ObservableList<Pokemon> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  final _$onRefreshAsyncAction = AsyncAction('_HomeControllerBase.onRefresh');

  @override
  Future onRefresh() {
    return _$onRefreshAsyncAction.run(() => super.onRefresh());
  }

  final _$onLoadAsyncAction = AsyncAction('_HomeControllerBase.onLoad');

  @override
  Future onLoad() {
    return _$onLoadAsyncAction.run(() => super.onLoad());
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons}
    ''';
  }
}
