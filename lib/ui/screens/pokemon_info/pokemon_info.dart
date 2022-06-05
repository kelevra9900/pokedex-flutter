import 'dart:math';
import 'package:flutter/material.dart' hide AnimatedSlide;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_demo/config/colors.dart';

import 'package:pokedex_demo/config/images.dart';
import 'package:pokedex_demo/models/pokemondetail_model.dart';
import 'package:pokedex_demo/states/pokemon/pokemon_bloc.dart';
import 'package:pokedex_demo/states/pokemon/pokemon_selector.dart';
import 'package:pokedex_demo/ui/widgets/animated_slide.dart';

// import 'package:pokedex_demo/ui/widgets/animated_slide.dart';
import 'package:pokedex_demo/ui/widgets/auto_slideup_panel.dart';

import 'package:pokedex_demo/ui/screens/pokemon_info/state_provider.dart';
import 'package:pokedex_demo/ui/widgets/animated_fade.dart';
import 'package:pokedex_demo/ui/widgets/hero.dart';
import 'package:pokedex_demo/ui/widgets/main_app_bar.dart';
import 'package:pokedex_demo/ui/widgets/main_tab_view.dart';
import 'package:pokedex_demo/ui/widgets/pokemon_image.dart';
// import 'package:pokedex_demo/ui/widgets/pokemon_type.dart';

part 'sections/background_decoration.dart';
part 'sections/pokemon_info_card.dart';
part 'sections/pokemon_overall_info.dart';
part 'sections/pokemon_info_card_about.dart';

class PokemonInfoScreen extends StatefulWidget {
  const PokemonInfoScreen({Key? key}) : super(key: key);

  @override
  State<PokemonInfoScreen> createState() => _PokemonInfoScreenState();
}

class _PokemonInfoScreenState extends State<PokemonInfoScreen>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _rotateController;
  @override
  void initState() {
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    )..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _slideController.dispose();
    _rotateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PokemonInfoStateProvider(
      slideController: _slideController,
      rotateController: _rotateController,
      child: Scaffold(
        body: Stack(
          children: const [
            _BackgroundDecoration(),
            _PokemonInfoCard(),
            _PokemonOverallInfo(),
          ],
        ),
      ),
    );
  }
}
