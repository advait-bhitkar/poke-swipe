abstract class PokemonCardEvent {}

class LoadInitialCards extends PokemonCardEvent {}

class SwipeCard extends PokemonCardEvent {
  final bool liked;
  SwipeCard({required this.liked});
}

class LoadMoreCards extends PokemonCardEvent {}
