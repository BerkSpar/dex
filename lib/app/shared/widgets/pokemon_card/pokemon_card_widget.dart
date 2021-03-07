import 'package:dex/app/shared/models/pokemon.dart';
import 'package:dex/app/shared/extensions/string.dart';
import 'package:dex/app/shared/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokemonCardWidget extends StatelessWidget {
  final Pokemon pokemon;

  PokemonCardWidget(this.pokemon);

  Widget _getTypes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(pokemon.types.length, (index) {
        final type = pokemon.types[index].type;
        return Container(
          decoration: BoxDecoration(
            color: Colors.white30,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: EdgeInsets.symmetric(vertical: 4),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Text(
              type.name.capitalize(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Container(
            color: colors[pokemon.types[0].type.name],
          ),
          Positioned(
            right: -20,
            bottom: -20,
            child: Opacity(
              opacity: 0.45,
              child: Image.asset(
                'assets/pokeball.png',
                height: 120,
                width: 120,
              ),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: SvgPicture.network(
              pokemon.sprites.other.dreamWorld.frontDefault,
              height: 64,
              width: 64,
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  pokemon.name.capitalize(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _getTypes(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
