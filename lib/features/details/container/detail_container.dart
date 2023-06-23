
import 'package:flutter/cupertino.dart';

import '../../../common/error/failure.dart';
import '../../../common/models/pokemon.dart';
import '../../../common/repositories/pokemon_repository.dart';
import '../../../common/widgets/po_error.dart';
import '../../../common/widgets/po_loading.dart';
import '../pages/detail_page.dart';


class DetailArguments {
  DetailArguments({required this.name});
  final String name;
}

class DetailContainer extends StatelessWidget {
  const DetailContainer(
      {Key? key, required this.repository, required this.arguments})
      : super(key: key);
  final IPokemonRepository repository;
  final DetailArguments arguments;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return PoLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return DetailPage(name: arguments.name, list: snapshot.data!);
        }

        if (snapshot.hasError) {
          return PoError(
            error: (snapshot.error as Failure).message!,
          );
        }

        return Container();
      },
    );
  }
}
