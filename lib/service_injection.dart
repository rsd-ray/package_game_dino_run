import 'package:get_it/get_it.dart';

import 'navigator_action.dart';
import 'set_score_action.dart';

final injection = GetIt.instance;

void popAction(Function action) {
  injection.registerLazySingleton(() => NavigatorAction(action: action));
}

void scoreAction(Function(int) action) {
  injection.registerLazySingleton(() => SetScoreAction(action: action));
}

void tearDown() async {
  await injection.reset();
}