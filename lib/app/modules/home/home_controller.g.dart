// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$pokemonsAtom =
      Atom(name: '_HomeControllerBase.pokemons', context: context);

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

  late final _$onRefreshAsyncAction =
      AsyncAction('_HomeControllerBase.onRefresh', context: context);

  @override
  Future onRefresh() {
    return _$onRefreshAsyncAction.run(() => super.onRefresh());
  }

  late final _$onLoadAsyncAction =
      AsyncAction('_HomeControllerBase.onLoad', context: context);

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
