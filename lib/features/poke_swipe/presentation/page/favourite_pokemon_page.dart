import 'package:flutter/material.dart';
import 'package:poke_swipe/core/base/base_widget.dart';
import 'package:poke_swipe/core/theme/colors.dart';
import '../../domain/entity/pokemon_entity.dart';
import '../../data/data_source/local_favourite_pokemon_data_source.dart';
import '../widget/pokemon_swipe_card.dart';

class FavouritePokemonPage extends BaseStatefulWidget {
  const FavouritePokemonPage({super.key});

  @override
  State<FavouritePokemonPage> createState() => _FavouritePokemonPageState();
}

class _FavouritePokemonPageState extends State<FavouritePokemonPage> {
  late Future<List<PokemonEntity>> _favouritesFuture;

  @override
  void initState() {
    super.initState();
    _favouritesFuture = LocalFavouritePokemonDataSource().getFavourites();
  }

  void _showDetails(PokemonEntity pokemon) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: PokemonSwipeCard(
          pokemon: pokemon,
          onLike: null,
          onDislike: null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Pokémon'),
        backgroundColor: AppColors.primary(context),
      ),
      body: FutureBuilder<List<PokemonEntity>>(
        future: _favouritesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error:  ${snapshot.error}'));
          }
          final favourites = snapshot.data ?? [];
          if (favourites.isEmpty) {
            return Center(
              child: Text(
                'No favourite Pokémon yet.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary(context)),
              ),
            );
          }
          return Container(
            color: AppColors.background(context),
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: favourites.length,
              itemBuilder: (context, index) {
                final pokemon = favourites[index];
                return GestureDetector(
                  onTap: () => _showDetails(pokemon),
                  child: Card(
                    elevation: 4,
                    color: AppColors.surface(context),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: AppColors.background(context),
                          backgroundImage: NetworkImage(
                            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemon.id}.png',
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary(context),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Pokédex #${pokemon.id}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textSecondary(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
