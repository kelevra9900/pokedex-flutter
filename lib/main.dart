import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_demo/app.dart';
import 'package:pokedex_demo/core/network.dart';
import 'package:pokedex_demo/data/repositories/item_repository.dart';
import 'package:pokedex_demo/data/repositories/pokemon_repository.dart';
import 'package:pokedex_demo/data/source/github/github_datasource.dart';
import 'package:pokedex_demo/data/source/local/local_datasource.dart';
import 'package:pokedex_demo/states/item/item_bloc.dart';
import 'package:pokedex_demo/states/pokemon/pokemon_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalDataSource.initialize();

  runApp(
    MultiRepositoryProvider(
      providers: [
        /// Services
        RepositoryProvider<NetworkManager>(
          create: (context) => NetworkManager(),
        ),

        /// Data sources
        RepositoryProvider<LocalDataSource>(
          create: (context) => LocalDataSource(),
        ),
        RepositoryProvider<GithubDataSource>(
          create: (context) => GithubDataSource(context.read<NetworkManager>()),
        ),

        /// Repositories
        RepositoryProvider<PokemonRepository>(
          create: (context) => PokemonDefaultRepository(
            localDataSource: context.read<LocalDataSource>(),
            githubDataSource: context.read<GithubDataSource>(),
          ),
        ),

        RepositoryProvider<ItemRepository>(
          create: (context) => ItemDefaultRepository(
            localDataSource: context.read<LocalDataSource>(),
            githubDataSource: context.read<GithubDataSource>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          /// BLoCs
          BlocProvider<PokemonBloc>(
            create: (context) => PokemonBloc(context.read<PokemonRepository>()),
          ),
          BlocProvider<ItemBloc>(
            create: (context) => ItemBloc(context.read<ItemRepository>()),
          ),
        ],
        child: PokedexApp(),
      ),
    ),
  );
}
