// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_demo/ui/screens/types/type_grid.dart';
import 'package:pokedex_demo/ui/widgets/main_app_bar.dart';
import 'package:pokedex_demo/ui/widgets/pokeball_background.dart';

// Class that is related to creating the whole type-effects page
class TypeEffectScreen extends StatelessWidget {
  List<Widget> _buildHeader(BuildContext context, bool innerBoxIsScrolled) {
    return [
      MainSliverAppBar(title: 'Type Effects'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PokeballBackground(
      child: NestedScrollView(
        headerSliverBuilder: _buildHeader,
        body: TypeEffectGrid(),
      ),
    );
  }
}
