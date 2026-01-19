import 'dart:math';
import 'package:flutter/material.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:poke_swipe/core/base/base_widget.dart';
import 'package:silver_shimmer/silver_shimmer.dart';
import '../widget/how_to_play_card.dart';
import '../widget/pokemon_swipe_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/pokemon_card_bloc.dart';
import '../bloc/pokemon_card_event.dart';
import '../bloc/pokemon_card_state.dart';
import '../../di/di.dart';
import 'package:poke_swipe/core/theme/colors.dart';
import 'package:get_it/get_it.dart';
import 'package:poke_swipe/core/logging/app_logger.dart';

// Numeric and string constants for styling and layout
const double kCardWidth = 400;
const double kCardHeight = 540;
const double kCardBorderRadius = 24;
const double kLoadingBorderRadius = 32;
const double kCardElevation = 5;
const double kCardHorizontalMargin = 16;
const double kCardVerticalMargin = 24;
const double kCardPadding = 16;
const String kAppTitle = 'PokeSwipe';
const String kNoPokemonText = 'No more Pokémon!';
const String kHowToPlayTitle = 'How to Play PokeSwipe';
const String kHowToPlayDesc = 'Pokemon appears one at a time, Choose "Like" or "Dislike", Build your favourite team';
const String kStartButtonText = 'Let\'s Go!';
const String kNoPokemonAvailableText = 'No Pokémon available.';

class PokemonSwipePage extends BaseStatefulWidget {
  const PokemonSwipePage({super.key});

  @override
  State<PokemonSwipePage> createState() => _PokemonSwipePageState();
}

class _PokemonSwipePageState extends State<PokemonSwipePage> with AutomaticKeepAliveClientMixin {
  late final AppinioSwiperController _swiperController;
  final AppLogger _logger = GetIt.I<AppLogger>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _swiperController = AppinioSwiperController();
  }

  @override
  void dispose() {
    _swiperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    return BlocProvider<PokemonCardBloc>(
      create: (_) => pokeSwipeDI<PokemonCardBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(kAppTitle),
          centerTitle: true,
          backgroundColor: AppColors.primary(context),
        ),
        body: SafeArea(
          child: BlocBuilder<PokemonCardBloc, PokemonCardState>(
            builder: (context, state) {
              if (state is PokemonInitialInfo) {
                _logger.d('HowToPlayCard shown');
                return const HowToPlayCard();
              }

              if (state is PokemonCardLoading) {
                _logger.d('PokemonCardLoading state');
                return Padding(
                  padding: const EdgeInsets.all(kCardHorizontalMargin),
                  child: Center(
                      child: const SizedBox(
                    width: kCardWidth,
                    height: kCardHeight,
                  ).shimmer(borderRadius: kLoadingBorderRadius,
                      baseColor: AppColors.shimmerBase(context),
                      highlightColor: AppColors.shimmerHighlight(context)),
                  ),
                );
              }
              if (state is PokemonCardError) {
                _logger.e('PokemonCardError: ${state.message}');
                return Center(child: Text(state.message));
              }
              if (state is PokemonCardEnd) {
                _logger.d('PokemonCardEnd: No more Pokémon');
                return const Center(child: Text(kNoPokemonText));
              }
              if (state is PokemonCardLoaded) {
                final cards = state.cards;
                _logger.d('PokemonCardLoaded: ${cards.length} cards loaded');
                if (cards.isEmpty) {
                  _logger.d('PokemonCardLoaded: No Pokémon available');
                  return const Center(child: Text(kNoPokemonAvailableText));
                }
                return Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: kCardWidth,
                    height: kCardHeight,
                    child: AppinioSwiper(
                      controller: _swiperController,
                      key: ValueKey(Random().nextInt(1000)),
                      cardCount: cards.length,
                      backgroundCardScale: 0.9,
                      isDisabled: true,
                      cardBuilder: (context, index) {
                        return PokemonSwipeCard(
                          pokemon: cards[index],
                          onLike: () {
                            _logger.d('User liked Pokémon: id=${cards[index].id}, name=${cards[index].name}');
                            _swiperController.swipeRight();
                            Future.delayed(Duration(milliseconds: 100), () {
                              context.read<PokemonCardBloc>().add(
                                SwipeCard(liked: true),
                              );
                            });
                          },
                          onDislike: () {
                            _logger.d('User disliked Pokémon: id=${cards[index].id}, name=${cards[index].name}');
                            _swiperController.swipeLeft();
                            Future.delayed(Duration(milliseconds: 100), () {
                              context.read<PokemonCardBloc>().add(
                                SwipeCard(liked: false),
                              );
                            });
                          },
                        );
                      },
                      onSwipeEnd: (previousIndex, currentIndex, direction) {
                        _logger.d('SwipeEnd: previousIndex=$previousIndex, currentIndex=$currentIndex, direction=$direction');
                        if (direction.toString().contains('right')) {
                          context.read<PokemonCardBloc>().add(
                            SwipeCard(liked: true),
                          );
                        } else if (direction.toString().contains('left')) {
                          context.read<PokemonCardBloc>().add(
                            SwipeCard(liked: false),
                          );
                        }
                      },
                      onEnd: () {
                        _logger.d('AppinioSwiper onEnd: No more cards to swipe');
                        context.read<PokemonCardBloc>().add(
                          SwipeCard(liked: false),
                        );
                      },
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
