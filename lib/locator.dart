import 'package:get_it/get_it.dart';
import 'package:SOUFEEDBACKAPP/services/navigation_service.dart';
import 'package:SOUFEEDBACKAPP/services/dialogService.dart';
import 'services/api_services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerFactory(() => ApiService());
}
