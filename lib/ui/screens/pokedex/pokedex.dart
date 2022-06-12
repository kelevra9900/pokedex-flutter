// ignore_for_file: use_key_in_widget_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_demo/configs/durations.dart';
import 'package:pokedex_demo/configs/images.dart';
import 'package:pokedex_demo/core/extensions/animation.dart';
import 'package:pokedex_demo/domain/entities/pokemon.dart';
import 'package:pokedex_demo/routes.dart';
import 'package:pokedex_demo/states/pokemon/pokemon_bloc.dart';
import 'package:pokedex_demo/states/pokemon/pokemon_event.dart';
import 'package:pokedex_demo/states/pokemon/pokemon_selector.dart';
import 'package:pokedex_demo/states/pokemon/pokemon_state.dart';
import 'package:pokedex_demo/ui/modals/generation_modal.dart';
import 'package:pokedex_demo/ui/modals/search_modal.dart';
import 'package:pokedex_demo/ui/widgets/pokemon_card.dart';
import 'package:pokedex_demo/ui/widgets/animated_overlay.dart';
import 'package:pokedex_demo/ui/widgets/fab.dart';
import 'package:pokedex_demo/ui/widgets/main_app_bar.dart';
import 'package:pokedex_demo/ui/widgets/pokeball_background.dart';
import 'package:pokedex_demo/ui/widgets/pokemon_refresh_control.dart';

part 'sections/fab_menu.dart';
part 'sections/pokemon_grid.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen();

  @override
  State<StatefulWidget> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  @override
  Widget build(BuildContext context) {
    return PokeballBackground(
      child: Stack(
        children: const [
          _PokemonGrid(),
          _FabMenu(),
        ],
      ),
    );
  }
}
