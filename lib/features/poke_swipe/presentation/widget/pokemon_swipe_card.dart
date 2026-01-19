import 'package:flutter/material.dart';
import 'package:poke_swipe/core/base/base_widget.dart';
import 'package:poke_swipe/core/theme/colors.dart';
import 'package:poke_swipe/features/poke_swipe/domain/entity/pokemon_entity.dart';

// Numeric and string constants for styling and layout
const double kCardWidth = 400;
const double kCardHeight = 500;
const double kCardBorderRadius = 24;
const double kCardElevation = 5;
const double kCardHorizontalMargin = 16;
const double kCardVerticalMargin = 24;
const double kCardPadding = 20;
const double kAvatarRadius = 60;
const double kNameFontSize = 32;
const double kDexFontSize = 18;
const double kTypeFontSize = 18;
const double kStatFontSize = 18;
const double kAbilityFontSize = 16;
const double kButtonFontSize = 16;
const String kNoDescription = 'No description available.';
const String kDislikeText = 'Dislike';
const String kLikeText = 'Like';

class PokemonSwipeCard extends BaseStatelessWidget {
  final PokemonEntity pokemon;
  final VoidCallback? onLike;
  final VoidCallback? onDislike;

  const PokemonSwipeCard({
    super.key,
    required this.pokemon,
    this.onLike,
    this.onDislike,
  });

  @override
  Widget buildContent(BuildContext context) {
    // Extract values from entity
    final int id = pokemon.id;
    final String name = pokemon.name[0].toUpperCase() + pokemon.name.substring(1);
    final String dexNumber = 'Pokédex #$id';
    final String imageUrl = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
    debugPrint("pokemon data : ${pokemon.toJson().toString()}");
    return Card(
      elevation: kCardElevation + 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kCardBorderRadius),
        side: BorderSide(
          color: AppColors.primary(context).withAlpha(40),
          width: 2,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: kCardHorizontalMargin, vertical: kCardVerticalMargin),
      color: Colors.transparent,
      shadowColor: AppColors.shadow(context),
      child: Container(
        width: kCardWidth,
        height: kCardHeight,
        padding: EdgeInsets.all(kCardPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kCardBorderRadius),
          color: AppColors.surface(context), // solid, non-transparent background
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow(context),
              blurRadius: 24,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primary(context),
                  width: 4,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary(context).withAlpha(40),
                    blurRadius: 16,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: kAvatarRadius,
                backgroundColor: AppColors.background(context),
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary(context),
                fontSize: kNameFontSize,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              dexNumber,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary(context),
                fontSize: kDexFontSize,
              ),
            ),
            const SizedBox(height: 12),
            // Types as chips (show all types)
            if (pokemon.types.isNotEmpty)
              Wrap(
                spacing: 8,
                children: pokemon.types
                    .where((type) => type.isNotEmpty)
                    .map((type) => Chip(
                      label: Text(
                        type.isNotEmpty ? (type[0].toUpperCase() + type.substring(1)) : '',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: AppColors.primary(context),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ))
                    .toList(),
              ),
            const SizedBox(height: 8),
            // Abilities as chips, marking hidden abilities
            if (pokemon.abilities.isNotEmpty)
              Wrap(
                spacing: 8,
                children: pokemon.abilities
                    .where((a) => a.name.isNotEmpty)
                    .map((a) => Chip(
                      label: Text(
                        a.isHidden
                          ? a.name[0].toUpperCase() + a.name.substring(1) + ' (Hidden)'
                          : a.name[0].toUpperCase() + a.name.substring(1),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: a.isHidden ? Colors.white : AppColors.textPrimary(context),
                          fontWeight: a.isHidden ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      backgroundColor: a.isHidden ? Colors.deepPurple : AppColors.secondary(context),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ))
                    .toList(),
              ),
            const Spacer(),
            if (onLike != null || onDislike != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (onDislike != null)
                    ElevatedButton.icon(
                      onPressed: onDislike,
                      icon: Icon(Icons.thumb_down, color: AppColors.error(context)),
                      label: Text(kDislikeText, style: TextStyle(fontSize: kButtonFontSize)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.surface(context),
                        foregroundColor: AppColors.error(context),
                        side: BorderSide(color: AppColors.error(context)),
                        elevation: 6,
                        shadowColor: AppColors.shadow(context),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      ),
                    ),
                  if (onLike != null)
                    ElevatedButton.icon(
                      onPressed: onLike,
                      icon: Icon(Icons.thumb_up, color: AppColors.primary(context)),
                      label: Text(kLikeText, style: TextStyle(fontSize: kButtonFontSize)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.surface(context),
                        foregroundColor: AppColors.primary(context),
                        side: BorderSide(color: AppColors.primary(context)),
                        elevation: 6,
                        shadowColor: AppColors.shadow(context),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      ),
                    ),
                ],
              ),
            if (onLike != null || onDislike != null)
              const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
