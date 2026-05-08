import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/dio_client.dart';
import 'features/feature_auth/data/data_source/auth_api_provider.dart';
import 'features/feature_auth/data/data_source/auth_local_service.dart';
import 'features/feature_auth/data/repository/auth_repository_impl.dart';
import 'features/feature_auth/domin/repository/auth_repository.dart';
import 'features/feature_auth/domin/usecase/change_pass_usecase.dart';
import 'features/feature_auth/domin/usecase/is_logged_in_usecase.dart';
import 'features/feature_auth/domin/usecase/logout_usecase.dart';
import 'features/feature_auth/domin/usecase/pass_change_code_usecase.dart';
import 'features/feature_auth/domin/usecase/send_email_usecase.dart';
import 'features/feature_auth/domin/usecase/sign_up_usecase.dart';
import 'features/feature_auth/domin/usecase/signin_usecase.dart';
import 'features/feature_splash/data/data_source/splash_local_data_source.dart';
import 'features/feature_splash/data/data_source/splash_remote_data_source.dart';
import 'features/feature_splash/data/repository/splash_repository_impl.dart';
import 'features/feature_splash/domain/repository/splash_repository.dart';
import 'features/feature_splash/domain/usecase/splash_usecases.dart';
import 'features/feature_splash/presentation/cubit/splash_cubit.dart';
import 'features/language/data/data_source/language_local_data_source.dart';
import 'features/language/data/repository/language_repository_impl.dart';
import 'features/language/domain/repository/language_repository.dart';
import 'features/language/domain/usecase/language_usecases.dart';
import 'features/language/presentation/cubit/language_cubit.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerSingleton<DioClient>(DioClient());
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);

  // // Firebase
  // sl.registerLazySingleton(() => FirebaseAuth.instance);
  // sl.registerLazySingleton(() => FirebaseFirestore.instance);
  // sl.registerLazySingleton(() => FirebaseStorage.instance);
  // sl.registerLazySingleton(() => FirebaseRemoteConfig.instance);

  await _initSplashFeature();
  await _initLanguageFeature();

  // provider
  sl.registerSingleton<AuthApiProvider>(AuthApiProviderImpl());
  sl.registerSingleton<AuthLocalService>(AuthLocalServiceImpl());

  // repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // Auth usecases
  sl.registerSingleton<SendEmailUsecase>(SendEmailUsecase());
  sl.registerSingleton<SignUpUsecase>(SignUpUsecase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());
  sl.registerSingleton<LogoutUsecase>(LogoutUsecase());
  sl.registerSingleton<ChangePassUsecase>(ChangePassUsecase());
  sl.registerSingleton<PassChangeCodeUsecase>(PassChangeCodeUsecase());
}

Future<void> _initSplashFeature() async {
  // Data sources
  sl.registerLazySingleton<SplashLocalDataSource>(() => SplashLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<SplashRemoteDataSource>(() => SplashRemoteDataSourceImpl(sl()));

  // Repositories
  sl.registerLazySingleton<SplashRepository>(() => SplashRepositoryImpl(sl(), sl()));

  // Use cases
  sl.registerSingleton<CheckInternetUseCase>(CheckInternetUseCase(sl()));
  sl.registerLazySingleton<CheckAppStateUseCase>(() => CheckAppStateUseCase(sl()));
  sl.registerLazySingleton<CheckFirstTimeUseCase>(() => CheckFirstTimeUseCase(sl()));
  sl.registerLazySingleton<CheckLoggedInUseCase>(() => CheckLoggedInUseCase(sl()));
  sl.registerLazySingleton<SetFirstTimeUseCase>(() => SetFirstTimeUseCase(sl()));

  // Cubit
  sl.registerFactory<SplashCubit>(() => SplashCubit(sl(), sl(), sl(), sl(), sl()));
}

Future<void> _initLanguageFeature() async {
  // Data sources
  sl.registerLazySingleton<LanguageLocalDataSource>(() => LanguageLocalDataSourceImpl(sl()));

  // Repositories
  sl.registerLazySingleton<LanguageRepository>(() => LanguageRepositoryImpl(sl()));

  // Usecase
  sl.registerSingleton<GetSavedLanguageUseCase>(GetSavedLanguageUseCase(sl()));
  sl.registerLazySingleton<SaveLanguageUseCase>(()=>SaveLanguageUseCase(sl()));

  // Cubit
  sl.registerFactory<LanguageCubit>(() => LanguageCubit(sl(), sl()));
}