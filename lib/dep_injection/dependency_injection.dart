import 'package:get_it/get_it.dart';
import 'package:n3imn_project_team/repositories/user_repo/barber_repsitory/barber_repo.dart';
import 'package:n3imn_project_team/repositories/user_repo/customer_repository/csutomer_repo.dart';
import 'package:n3imn_project_team/services/auth_service/barber_auth_service/barber_auth.dart';
import 'package:n3imn_project_team/services/auth_service/customer_auth_service/customer_auth.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/themes/data_theme.dart';
import 'package:n3imn_project_team/themes/texts_theme.dart';

GetIt getIt = GetIt.instance;
void setupDependncyInjection() {
  getIt.registerSingleton(BarberAuthService());
  getIt.registerSingleton(CustomerAuthService());
  getIt.registerSingleton(AppTheme());
  getIt.registerSingleton(AppColor());
  getIt.registerSingleton(AppTexts());
  getIt.registerSingleton(BarberRepository());
  getIt.registerSingleton(CustomerRepository());
}
