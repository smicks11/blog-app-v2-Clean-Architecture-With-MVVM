import 'package:blog_app_v2/data/data_source/remote_data_source.dart';
import 'package:blog_app_v2/data/network/app_api.dart';
import 'package:blog_app_v2/data/network/dio_factory.dart';
import 'package:blog_app_v2/data/network/network_info.dart';
import 'package:blog_app_v2/data/repository/repository_impl.dart';
import 'package:blog_app_v2/domain/repository/repository.dart';
import 'package:blog_app_v2/domain/usecase/get_news_usecase.dart';
import 'package:blog_app_v2/presentation/home/home_vm.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';


final instance = GetIt.instance;

Future<void> initAppModule() async {
  
  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(DataConnectionChecker()));

   // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());


  // app  service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementer(instance()));


  // repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance(),));

}

initHomeModule() {
  if (!GetIt.I.isRegistered<GetNewsUseCase>()) {
    instance.registerFactory<GetNewsUseCase>(() => GetNewsUseCase(instance()));
    instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
    
  }
}


resetModules() {
  instance.reset(dispose: false);
  initAppModule();
  initHomeModule();
}
