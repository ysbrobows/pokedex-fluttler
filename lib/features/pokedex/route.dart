import 'package:flutter/material.dart';
import 'package:flutter_iesb_application/common/repositories/pokemon_repository.dart';
import 'package:flutter_iesb_application/features/home/container/home_container.dart';

import '../details/container/detail_container.dart';

class PokedexRoute extends StatelessWidget {
  const PokedexRoute({Key? key, required this.repository}) : super(key: key);
  final PokemonRepository repository;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) {
              return HomeContainer(
                repository: repository,
                onItemTap: (route, arguments) {
                  Navigator.of(context).pushNamed(route, arguments: arguments);
                },
              );
            },
          );
        }

        if (settings.name == '/details') {
          return MaterialPageRoute(
            builder: (context) {
              return DetailContainer(
                repository: repository,
                arguments: (settings.arguments as DetailArguments),
                onBack: () => Navigator.of(context).pop(),
              );
            },
          );
        }
      },
    );
  }
}