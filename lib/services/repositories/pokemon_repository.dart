import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:pokedex_demo/domain/entities/pokemon.dart';
import 'package:pokedex_demo/domain/entities/pokemon_detail.dart';

class PokemonRepository {
  final String _baseURL = 'https://pokeapi.co/api/v2/pokemon?limit=20&offset=0';
  Pokemons _pokemons = Pokemons();
  Pokemons get pokemons => _pokemons;

  final List<PokemonDetailModel> _pokemonsDetail = [];
  List<PokemonDetailModel> get pokemonDetail => _pokemonsDetail;

  Future<dynamic> getAllPokemon({required int limit, required int page}) async {
    try {
      final response = await Dio().get('$_baseURL/$limit&offset=$page');
      _pokemons = Pokemons.fromJson(response.data);
      final data = pokemonsFromJson(response.data);

      if (response.statusCode == 200) {
        _pokemons = data;
        for (var result in _pokemons.results!) {
          await getPokemonsDetail(resultURL: result.url!);
        }
        return _pokemons;
      }
      return _pokemons;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<dynamic> getPokemonsDetail({required String resultURL}) async {
    try {
      final response = await Dio().get(_baseURL);
      final data = pokemonDetailModelFromJson(response.data);
      if (response.statusCode == 200) {
        _pokemonsDetail.add(data);

        return _pokemonsDetail;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<dynamic> getPokemon({required String pokemonId}) async {
    try {
      final response = await Dio().get('$_baseURL/$pokemonId');
      final data = pokemonDetailModelFromJson(response.data);
      if (response.statusCode == 200) {
        return data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
