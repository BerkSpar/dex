import 'package:dex/app/shared/widgets/pokemon_card/pokemon_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
      body: Stack(
        children: [
          Positioned(
            right: -48,
            top: -48,
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/blackball.png',
                height: 300,
                width: 300,
              ),
            ),
          ),
          Body(controller: controller),
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  final HomeController controller;

  const Body({
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
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
                'Dex',
                style: TextStyle(
                  fontSize: 42,
                  color: Colors.blueGrey,
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

                return PokemonCardWidget(
                  pokemon: pokemon,
                  onTap: () {},
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
