import 'package:get_it/get_it.dart';
import 'package:n3imn_project_team/services/auth_service/barber_auth_service/barber_auth.dart';
import 'package:n3imn_project_team/services/auth_service/customer_auth_service/customer_auth.dart';

GetIt getIt = GetIt.instance;
void setupDependncyInjection(){
 
  getIt.registerSingleton(BarberAuth());
  getIt.registerSingleton(CustomerAuth());
}
