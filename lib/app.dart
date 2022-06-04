import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pokedex_demo/config/colors.dart';
import 'package:pokedex_demo/config/constant.dart';
import 'package:pokedex_demo/routes.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialApp(
      color: Colors.white,
      title: 'Pokedex',
      theme: ThemeData(
        textTheme: theme.textTheme.apply(
          displayColor: AppColors.black,
        ),
        scaffoldBackgroundColor: AppColors.lightGrey,
        primarySwatch: Colors.blue,
      ),
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppNavigator.onGenerateRoute,
      builder: (context, child){
        if(child == null) return const SizedBox.shrink();
        final data = MediaQuery.of(context);
        final smallestSize = min(data.size.width, data.size.height);
        final textScaleFactor = min(smallestSize / AppConstants.designScreenSize.width, 1.0);
        return MediaQuery(
          data: data.copyWith(
            textScaleFactor: textScaleFactor,
          ),
          child: child,
        );
      }
    );
  }
}