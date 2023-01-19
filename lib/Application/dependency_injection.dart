import 'package:get_it/get_it.dart';
import 'package:point_counter/Application/app_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/controller/Points/points_cubit.dart';
import '../presentation/controller/app_settings/app_settings_cubit.dart';

final GetIt instanceGetIt = GetIt.instance;

Future<void> initialAppModule()async{
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  instanceGetIt.registerLazySingleton<SharedPreferences>(()=>sharedPreferences);
  instanceGetIt.registerLazySingleton<AppPreferences>(()=> AppPreferences(instanceGetIt()));
  instanceGetIt.registerFactory<AppSettingsCubit>(()=>AppSettingsCubit(instanceGetIt()));
  instanceGetIt.registerFactory<PointsCubit>(()=>PointsCubit());
}