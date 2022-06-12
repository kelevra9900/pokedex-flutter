// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pokedex_demo/configs/types.dart';

import 'modal_sheet.dart';

// Class responsible for creating the grid of pokeballs that consists of the respective types
class TypeEffectGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Builder(builder: (context) {
      return CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                (_, index) => ModalSheet(
                  width: w,
                  index: index,
                ),
                childCount: types.length,
              ),
            ),
          ),
        ],
      );
    });
  }
}
