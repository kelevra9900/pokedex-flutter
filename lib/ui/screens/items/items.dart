// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_demo/configs/durations.dart';
import 'package:pokedex_demo/configs/images.dart';
import 'package:pokedex_demo/core/extensions/animation.dart';
import 'package:pokedex_demo/states/item/item_bloc.dart';
import 'package:pokedex_demo/states/item/item_event.dart';
import 'package:pokedex_demo/states/item/item_selector.dart';
import 'package:pokedex_demo/states/item/item_state.dart';
import 'package:pokedex_demo/ui/modals/generation_modal.dart';
import 'package:pokedex_demo/ui/modals/search_modal.dart';
import 'package:pokedex_demo/ui/widgets/animated_overlay.dart';
import 'package:pokedex_demo/ui/widgets/fab.dart';
import 'package:pokedex_demo/ui/widgets/main_app_bar.dart';
import 'package:pokedex_demo/ui/widgets/pokeball_background.dart';
import 'package:pokedex_demo/ui/widgets/pokemon_refresh_control.dart';

import 'widgets/item_card.dart';

part 'sections/fab_menu.dart';
part 'sections/items_grid.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen();

  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return PokeballBackground(
      child: Stack(
        children: const [
          _ItemGrid(),
        ],
      ),
    );
  }
}
