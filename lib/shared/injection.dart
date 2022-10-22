import 'package:get_it/get_it.dart';

import '../network/remote/my_repository.dart';
import '../network/remote/web_services.dart';
import '../view_model/cubit/hotd_cubit.dart';

final getIt = GetIt.instance;

void initGit() {
  getIt.registerLazySingleton<HotdCubit>(() => HotdCubit(getIt()));
  getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt()));
  getIt.registerLazySingleton<WebServices>(
      () => WebServices(WebServices.createAndSetupDio()));
}
