import 'package:clean_architecture_sample_code/data/datasources/localdata/local_data_source.dart';
import 'package:clean_architecture_sample_code/data/datasources/remotedata/remote_data_source.dart';
import 'package:clean_architecture_sample_code/data/repositories/sample_data_repository_implementation.dart';
import 'package:clean_architecture_sample_code/domain/repositories/repos.dart';
import 'package:clean_architecture_sample_code/presentation/bloc/sample_data_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/util/input_converted.dart';
import 'domain/usecases/usecases.dart';

/* *
* * Get It Rules :
* * Never Declare Presentation Layer Login Classes as Singleton So Use Factory Instead
* * Any Dependencies Passed as Parameters to Classes Should Declared Also By Get It
* */
final GetIt getIt = GetIt.instance;

Future<void> init() async {

  // * Bloc Classes
  getIt.registerFactory(() => SampleDataBloc(concreteData: getIt(), randomData: getIt(), inputConverter: getIt()));


  // * Use Cases
  getIt.registerLazySingleton(() => GetSampleData(getIt()));
  getIt.registerLazySingleton(() => GetRandomSampleData(getIt()));


  // * Repositories
  getIt.registerLazySingleton<SampleDataRepository>(() =>
      SampleDataRepositoryImpl(
          remoteDataSource: getIt(),
          localDataSource: getIt(),
          networkInfo: getIt()));


  // * Data Sources
  getIt.registerLazySingleton<RemoteSampleDataSource>(
      () => RemoteSampleDataSourceImpl(client: getIt()));
  getIt.registerLazySingleton<LocalSampleDataSource>(
      () => LocalSampleDataSourceImpl(sharedPreferences: getIt()));


  // * Core
  getIt.registerLazySingleton(() => InputConverter());
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));


  // *  External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
