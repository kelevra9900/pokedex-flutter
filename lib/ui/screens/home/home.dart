// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:pokedex_demo/configs/colors.dart';
import 'package:pokedex_demo/configs/images.dart';
import 'package:pokedex_demo/data/categories.dart';
import 'package:pokedex_demo/domain/entities/category.dart';
import 'package:pokedex_demo/ui/widgets/search_bar.dart';
import 'package:pokedex_demo/ui/widgets/pokeball_background.dart';
import 'package:pokedex_demo/routes.dart';

import 'widgets/news_card.dart';
import 'widgets/category_card.dart';

part 'sections/pokemon_news.dart';
part 'sections/header_card_content.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  bool showTitle = false;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final offset = _scrollController.offset;
    final showTitle = offset > _HeaderCardContent.height - kToolbarHeight;

    // Prevent unneccesary rebuild
    if (this.showTitle == showTitle) return;

    setState(() {
      this.showTitle = showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (_, __) => [
          SliverAppBar(
            expandedHeight: _HeaderCardContent.height,
            floating: true,
            pinned: true,
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            backgroundColor: AppColors.red,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              centerTitle: true,
              title: Visibility(
                visible: showTitle,
                child: const Text(
                  'Pokedex',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              background: _HeaderCardContent(),
            ),
          ),
        ],
        body: const _PokemonNews(),
      ),
    );
  }
}
