import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/dio_client.dart';
import 'features/feature_auth/data/data_source/auth_remote_data_source.dart';
import 'features/feature_auth/data/data_source/auth_local_data_source.dart';
import 'features/feature_auth/data/repository/auth_repository_impl.dart';
import 'features/feature_auth/domain/repository/auth_repository.dart';
import 'features/feature_auth/domain/usecase/auth_usecases.dart';
import 'features/feature_auth/presentation/bloc/cubit/auth_cubit.dart';
import 'features/feature_startup/data/data_source/startup_local_data_source.dart';
import 'features/feature_startup/data/data_source/startup_remote_data_source.dart';
import 'features/feature_startup/data/repository/startup_repository_impl.dart';
import 'features/feature_startup/domain/repository/startup_repository.dart';
import 'features/feature_startup/domain/usecase/startup_usecases.dart';
import 'features/feature_startup/presentation/cubit/startup_cubit.dart';
import 'features/language/data/data_source/language_local_data_source.dart';
import 'features/language/data/repository/language_repository_impl.dart';
import 'features/language/domain/repository/language_repository.dart';
import 'features/language/domain/usecase/language_usecases.dart';
import 'features/language/presentation/cubit/language_cubit.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  _registerCoreDependencies();
  await _registerAsyncDependencies();
  _registerFeatures();
}

// Core Dependencies (Synchronous)
void _registerCoreDependencies() {
  // Network
  sl.registerSingleton<DioClient>(DioClient());
  // Firebase
  // sl.registerLazySingleton(() => FirebaseAuth.instance);
  // sl.registerLazySingleton(() => FirebaseFirestore.instance);
  // sl.registerLazySingleton(() => FirebaseStorage.instance);
  // sl.registerLazySingleton(() => FirebaseRemoteConfig.instance);
}

// Async Dependencies (Requires await)
Future<void> _registerAsyncDependencies() async {
  // Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);
}

// Feature Registrations
 _registerFeatures()  {
   _initStartupFeature();
   _initLanguageFeature();
  _initAuthFeature();
}


// Startup Feature
 void _initStartupFeature()  {
  // Data Sources
  sl.registerLazySingleton<StartupLocalDataSource>(() => StartupLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<StartupRemoteDataSource>(() => StartupRemoteDataSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<StartupRepository>(() => StartupRepositoryImpl(sl(), sl()));

  // Use Cases
  sl.registerSingleton<CheckInternetUseCase>(CheckInternetUseCase(sl()));
  sl.registerLazySingleton<CheckAppStateUseCase>(() => CheckAppStateUseCase(sl()));
  sl.registerLazySingleton<CheckFirstTimeUseCase>(() => CheckFirstTimeUseCase(sl()));
  sl.registerLazySingleton<SetFirstTimeUseCase>(() => SetFirstTimeUseCase(sl()));

  // Cubit
  sl.registerFactory<StartupCubit>(() => StartupCubit(sl(),sl(), sl(), sl(),));
}


// Language Feature
 void _initLanguageFeature()  {
  // Data Sources
  sl.registerLazySingleton<LanguageLocalDataSource>(() => LanguageLocalDataSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<LanguageRepository>(() => LanguageRepositoryImpl(sl()));

  // Use Cases
  sl.registerSingleton<GetSavedLanguageUseCase>(GetSavedLanguageUseCase(sl()));
  sl.registerLazySingleton<SaveLanguageUseCase>(() => SaveLanguageUseCase(sl()));

  // Cubit
  sl.registerFactory<LanguageCubit>(() => LanguageCubit(sl(), sl()));
}


// Auth Feature
void _initAuthFeature() {
  // Data Sources
  sl.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl(sl(),sl()));
  sl.registerSingleton<AuthLocalDataSource>(AuthLocalDataSourceImpl(sl()));

  // Repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl(),sl()));

  // Use Cases
  sl.registerLazySingleton<CheckLoggedInUseCase>(() => CheckLoggedInUseCase(sl()));
  sl.registerLazySingleton<SignUpWithEmailUseCase>(()=> SignUpWithEmailUseCase(sl()));
  sl.registerLazySingleton<VerifyEmailUseCase>(()=> VerifyEmailUseCase(sl()));
  sl.registerLazySingleton<SignInWithEmailUseCase>(()=> SignInWithEmailUseCase(sl()));
  sl.registerLazySingleton<ChangePasswordUseCase>(()=> ChangePasswordUseCase(sl()));
  sl.registerLazySingleton<RequestResetCodeUseCase>(()=> RequestResetCodeUseCase(sl()));
  sl.registerLazySingleton<VerifyResetCodeUseCase>(()=> VerifyResetCodeUseCase(sl()));
  sl.registerLazySingleton<ResetPasswordUseCase>(()=> ResetPasswordUseCase(sl()));
  sl.registerLazySingleton<LogoutUseCase>(()=>LogoutUseCase(sl()));

  // Cubit
  sl.registerFactory<AuthCubit>(() => AuthCubit(sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl()));
}
