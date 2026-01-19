import 'package:poke_swipe/features/poke_swipe/domain/entity/version_entity.dart';

import 'language_entity.dart';

class FlavorTextEntity {
  final String flavorText;
  final LanguageEntity language;
  final VersionEntity version;
  FlavorTextEntity({required this.flavorText, required this.language, required this.version});
}

