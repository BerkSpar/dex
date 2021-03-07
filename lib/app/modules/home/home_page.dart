import 'package:dex/app/shared/widgets/pokemon_card/pokemon_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        return SmartRefresher(
          controller: controller.refreshController,
          onLoading: controller.onLoad,
          onRefresh: controller.onRefresh,
          enablePullDown: true,
          enablePullUp: true,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16, 72, 16, 0),
                child: Text(
                  'My Dex',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 24),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                ),
                shrinkWrap: true,
                physics: ScrollPhysics(),
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                itemCount: controller.pokemons.length,
                itemBuilder: (_, index) {
                  final pokemon = controller.pokemons[index];

                  return PokemonCardWidget(pokemon);
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
