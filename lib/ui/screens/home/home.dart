import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_demo/config/images.dart';
import 'package:pokedex_demo/models/pokemondetail_model.dart';
import 'package:pokedex_demo/routes.dart';

import 'package:pokedex_demo/states/pokemon/pokemon_bloc.dart';
import 'package:pokedex_demo/states/pokemon/pokemon_selector.dart';
import 'package:pokedex_demo/ui/widgets/main_app_bar.dart';
import 'package:pokedex_demo/ui/widgets/pokeball_background.dart';
import 'package:pokedex_demo/ui/widgets/pokemon_card.dart';
import 'package:pokedex_demo/ui/widgets/pokemon_refresh_control.dart';
part 'sections/home_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PokeballBackground(
      child: Stack(
        children: const [
          _PokemonGrid(),
        ],
      ),
    );
  }
}
