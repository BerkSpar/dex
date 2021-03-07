import 'package:dex/app/shared/models/pokemon.dart';
import 'package:dex/app/shared/repositories/poke_api_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final pokeApi = Modular.get<PokeApiRepository>();
  final refreshController = RefreshController();

  @observable
  ObservableList<Pokemon> pokemons = <Pokemon>[].asObservable();

  _HomeControllerBase() {
    onRefresh();
  }

  @action
  onRefresh() async {
    final list = await pokeApi.getPokemons(initial: true);
    pokemons = list.asObservable();
    refreshController.refreshCompleted();
  }

  @action
  onLoad() async {
    final list = await pokeApi.getPokemons();
    pokemons.addAll(list.asObservable());
    refreshController.loadComplete();
  }
}
