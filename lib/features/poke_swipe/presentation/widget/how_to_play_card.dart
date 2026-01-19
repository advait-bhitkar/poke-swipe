import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_swipe/core/base/base_widget.dart';
import '../../../../core/theme/colors.dart';
import '../bloc/pokemon_card_bloc.dart';
import '../bloc/pokemon_card_event.dart';

const double kCardWidth = 400;
const double kCardHeight = 500;
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

class HowToPlayCard extends BaseStatelessWidget {
  const HowToPlayCard({super.key});


  @override
  Widget buildContent(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: kCardWidth,
        height: kCardHeight,
        child: Card(
          elevation: kCardElevation + 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kCardBorderRadius),
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: kCardHorizontalMargin,
            vertical: kCardVerticalMargin,
          ),
          color: Colors.transparent,
          shadowColor: AppColors.shadow(context),
          child: Container(
            width: kCardWidth,
            height: kCardHeight,
            padding: EdgeInsets.all(kCardPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kCardBorderRadius),
              gradient: LinearGradient(
                colors: [
                  AppColors.primary(context).withAlpha((0.18 * 255).toInt()),
                  AppColors.surface(context).withAlpha((0.95 * 255).toInt()),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow(context),
                  blurRadius: 24,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Icon(Icons.catching_pokemon, size: 64, color: AppColors.secondary(context)),
                const SizedBox(height: 24),
                Text(
                  kHowToPlayTitle,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.textPrimary(context),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  kHowToPlayDesc,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary(context),
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: () {
                    context.read<PokemonCardBloc>().add(
                      LoadInitialCards(),
                    );
                  },
                  icon: Icon(Icons.play_circle, color: AppColors.secondary(context)),
                  label: Text(
                    kStartButtonText,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.primary(context),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.surface(context).withAlpha((0.92 * 255).toInt()),
                    foregroundColor: AppColors.primary(context),
                    side: BorderSide(color: AppColors.primary(context)),
                    elevation: 8,
                    shadowColor: AppColors.shadow(context),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}