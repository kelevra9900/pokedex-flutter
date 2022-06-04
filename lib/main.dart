import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_demo/app.dart';

import 'package:pokedex_demo/core/network.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiRepositoryProvider(
      providers: [
        // Service for network requests
        RepositoryProvider<NetworkManager>(
          create: (context) => NetworkManager(),
        ),

      ],
      child: const PokedexApp(),
    ),
  );
}