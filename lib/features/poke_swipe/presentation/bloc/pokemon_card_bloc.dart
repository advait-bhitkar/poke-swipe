import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:poke_swipe/core/logging/app_logger.dart';
import 'pokemon_card_event.dart';
import 'pokemon_card_state.dart';
import '../../domain/use_case/get_pokemon_use_case.dart';
import '../../domain/use_case/get_next_unique_pokemon_id_use_case.dart';
import '../../domain/use_case/save_favourite_pokemon_use_case.dart';
import 'package:poke_swipe/features/poke_swipe/domain/entity/pokemon_entity.dart';

class PokemonCardBloc extends Bloc<PokemonCardEvent, PokemonCardState> {
  final GetPokemonUseCase getPokemonUseCase;
  final GetNextUniquePokemonIdUseCase getNextUniquePokemonIdUseCase;
  final SaveFavouritePokemonUseCase saveFavouritePokemonUseCase;
  final int preloadCount;
  final AppLogger _logger = GetIt.I<AppLogger>();

  final List<PokemonEntity> _cardQueue = [];

  PokemonCardBloc({
    required this.getPokemonUseCase,
    required this.getNextUniquePokemonIdUseCase,
    required this.saveFavouritePokemonUseCase,
    this.preloadCount = 5,
  }) : super(PokemonInitialInfo()) {
    on<LoadInitialCards>(_onLoadInitialCards);
    on<SwipeCard>(_onSwipeCard);
    on<LoadMoreCards>(_onLoadMoreCards);
  }

  Future<void> _onLoadInitialCards(LoadInitialCards event, Emitter<PokemonCardState> emit) async {
    _logger.d('Event: LoadInitialCards');
    emit(PokemonCardLoading());
    _logger.d('State: PokemonCardLoading');
    _cardQueue.clear();
    await _preloadCards();
    if (_cardQueue.isEmpty) {
      _logger.d('State: PokemonCardEnd');
      emit(PokemonCardEnd());
    } else {
      _logger.d('State: PokemonCardLoaded with ${_cardQueue.length} cards');
      emit(PokemonCardLoaded(List.from(_cardQueue)));
    }
  }

  Future<void> _onLoadMoreCards(LoadMoreCards event, Emitter<PokemonCardState> emit) async {
    _logger.d('Event: LoadMoreCards');
    await _preloadCards();
    _logger.d('State: PokemonCardLoaded with ${_cardQueue.length} cards');
    emit(PokemonCardLoaded(List.from(_cardQueue)));
  }

  Future<void> _onSwipeCard(SwipeCard event, Emitter<PokemonCardState> emit) async {
    _logger.d('Event: SwipeCard, liked=${event.liked}');
    if (_cardQueue.isNotEmpty) {
      final swipedPokemon = _cardQueue.first;
      if (event.liked) {
        try {
          await saveFavouritePokemonUseCase(swipedPokemon);
          _logger.d('Saved favourite Pokémon: id=${swipedPokemon.id}, name=${swipedPokemon.name}');
        } catch (e, st) {
          _logger.e('Error saving favourite Pokémon: id=${swipedPokemon.id}', error: e, stackTrace: st);
        }
      }
      _cardQueue.removeAt(0);
    }
    // Trigger loading more cards when 5 or fewer are left
    if (_cardQueue.length < 5) {
      add(LoadMoreCards());
    }
    await _preloadCards();
    if (_cardQueue.isEmpty) {
      _logger.d('State: PokemonCardEnd');
      emit(PokemonCardEnd());
    } else {
      _logger.d('State: PokemonCardLoaded with ${_cardQueue.length} cards');
      emit(PokemonCardLoaded(List.from(_cardQueue)));
    }
  }

  Future<void> _preloadCards() async {
    while (_cardQueue.length < preloadCount) {
      final id = await getNextUniquePokemonIdUseCase();
      if (id == null) break;
      final result = await getPokemonUseCase(params: id);
      if (result.isSuccess && result.data != null) {
        _cardQueue.add(result.data!);
      }
    }
  }
}
