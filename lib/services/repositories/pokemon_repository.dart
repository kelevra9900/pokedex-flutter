import 'package:dio/dio.dart';
import 'package:pokedex_demo/models/pokemondetail_model.dart';
import 'package:pokedex_demo/models/pokemons_model.dart';
// import 'package:pokedex_demo/models/pokemons_model.dart';

abstract class PokemonRepository {
  Future<dynamic> getAllPokemons();
  Future<dynamic> getPokemons({required int limit, required int page});
  Future<dynamic> getPokemon(String id);
}

class PokemonDefaultRepository extends PokemonRepository {
  late PokemonsModel _pokemonData = PokemonsModel();
  PokemonsModel get pokermonsDetail => _pokemonData;

  late final List<PokemonDetailModel> _pokemonDetailData = [];
  List<PokemonDetailModel> get pokemonDetail => _pokemonDetailData;

  @override
  Future<dynamic> getAllPokemons() async {
    late final PokemonsModel pokemons;
    try {
      final response =
          await Dio().get('https://pokeapi.co/api/v2/pokemon?limit=20');

      if (response.statusCode == 200) {
        pokemons = PokemonsModel.fromJson(response.data);

        for (var results in pokemons.results!) {
          final fetch = await Dio().get(results.url!);
          if (fetch.statusCode == 200) {
            _pokemonDetailData.add(PokemonDetailModel.fromJson(fetch.data));
            return _pokemonDetailData;
            // pokemonsDetails.add(PokemonDetailModel.fromJson(fetch.data));

          }
        }
      }
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<PokemonDetailModel> getPokemon(String id) {
    try {
      return Dio()
          .get('https://pokeapi.co/api/v2/pokemon/$id')
          .then((response) => PokemonDetailModel.fromJson(response.data));
    } catch (e) {
      throw UnimplementedError();
    }
    // throw UnimplementedError();
  }

  @override
  Future<dynamic> getPokemons({required int limit, required int page}) async {
    late final PokemonsModel pokemons;
    try {
      final response = await Dio()
          .get('https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$page');
      if (response.statusCode == 200) {
        pokemons = PokemonsModel.fromJson(response.data);

        for (var results in pokemons.results!) {
          final fetch = await Dio().get(results.url!);
          if (fetch.statusCode == 200) {
            _pokemonDetailData.add(PokemonDetailModel.fromJson(fetch.data));
            return _pokemonDetailData;
          }
        }
      }
    } catch (e) {
      print('ERROR FETCHING ${e.toString()}');
      throw UnimplementedError();
    }
  }
}
