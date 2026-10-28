import 'package:get_it/get_it.dart';
import 'mural_viewmodel.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerFactory<MuralViewModel>(() => MuralViewModel());
}