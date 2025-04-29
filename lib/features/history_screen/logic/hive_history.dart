import 'package:hive_flutter/hive_flutter.dart';

import '../../../shared/models/game_model.dart';

List<dynamic> readHistory(Box<dynamic> box) {
  return box.get("History") ?? [];
}
