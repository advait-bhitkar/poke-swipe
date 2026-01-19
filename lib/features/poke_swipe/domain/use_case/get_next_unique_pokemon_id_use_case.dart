import 'dart:math';
import 'package:poke_swipe/core/resource/use_case.dart';

class GetNextUniquePokemonIdUseCase extends UseCase<int?, void> {
  final int maxId;
  final Set<int> _shownIds = {};
  final Random _random;

  GetNextUniquePokemonIdUseCase({this.maxId = 1000, Random? random}) : _random = random ?? Random();

  @override
  Future<int?> call({void params}) async {
    if (_shownIds.length >= maxId) return null;
    int id;
    do {
      id = _random.nextInt(maxId) + 1;
    } while (_shownIds.contains(id));
    _shownIds.add(id);
    return id;
  }

  void reset() => _shownIds.clear();

  Set<int> get shownIds => _shownIds;
}
