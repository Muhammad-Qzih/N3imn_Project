import 'package:get_it/get_it.dart';
import 'package:n3imn_project_team/services/auth_service/auth_service.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/themes/data_theme.dart';
import 'package:n3imn_project_team/themes/texts_theme.dart';

GetIt getIt = GetIt.instance;
void setupDependncyInjection() {
  getIt.registerSingleton(AuthService());
  getIt.registerSingleton(AppTheme());
  getIt.registerSingleton(AppColor());
  getIt.registerSingleton(AppTexts());
  // getIt.registerSingleton(BarberRepository());
  // getIt.registerSingleton(CustomerRepository());
}
