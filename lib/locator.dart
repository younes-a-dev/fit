import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/dio_client.dart';
import 'features/exercise_plan_feature/data/data_source/exercise_plan_local_data_source.dart';
import 'features/exercise_plan_feature/data/data_source/exercise_plan_remote_data_source.dart';
import 'features/exercise_plan_feature/data/repository/exercise_plan_repository_impl.dart';
import 'features/exercise_plan_feature/domain/repository/exercise_plan_repository.dart';
import 'features/exercise_plan_feature/domain/usecases/exercise_plan_usecases.dart';
import 'features/exercise_plan_feature/presentation/cubit/exercise_plan_cubit.dart';
import 'features/feature_auth/data/data_source/auth_remote_data_source.dart';
import 'features/feature_auth/data/data_source/auth_local_data_source.dart';
import 'features/feature_auth/data/repository/auth_repository_impl.dart';
import 'features/feature_auth/domain/repository/auth_repository.dart';
import 'features/feature_auth/domain/usecase/auth_usecases.dart';
import 'features/feature_auth/presentation/bloc/cubit/auth_cubit.dart';
import 'features/feature_exercise/data/data_source/exercise_local_data_source.dart';
import 'features/feature_exercise/data/data_source/exercise_remote_data_source.dart';
import 'features/feature_exercise/data/repository/exercise_repository_impl.dart';
import 'features/feature_exercise/domain/repository/exercise_repository.dart';
import 'features/feature_exercise/domain/usecases/get_exercise_detail_use_case.dart';
import 'features/feature_exercise/domain/usecases/get_exercises_use_case.dart';
import 'features/feature_exercise/presentation/cubit/exercise_cubit.dart';
import 'features/feature_startup/data/data_source/startup_local_data_source.dart';
import 'features/feature_startup/data/data_source/startup_remote_data_source.dart';
import 'features/feature_startup/data/repository/startup_repository_impl.dart';
import 'features/feature_startup/domain/repository/startup_repository.dart';
import 'features/feature_startup/domain/usecase/startup_usecases.dart';
import 'features/feature_startup/presentation/cubit/startup_cubit.dart';
import 'features/feature_user/data/data_source/user_local_data_source.dart';
import 'features/feature_user/data/data_source/user_remote_data_source.dart';
import 'features/feature_user/data/repository/user_repository_impl.dart';
import 'features/feature_user/domain/repository/user_repository.dart';
import 'features/feature_user/domain/usecase/user_usecases.dart';
import 'features/feature_user/presentation/cubit/user_cubit.dart';
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
 void _registerFeatures()  {
   _initStartupFeature();
   _initLanguageFeature();
   _initAuthFeature();
   _initUserFeature();
   _initExerciseFeature();
   _initExercisePlanFeature();
}


// Startup Feature
 void _initStartupFeature()  {
  // Data Sources
  sl.registerLazySingleton<StartupLocalDataSource>(() => StartupLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<StartupRemoteDataSource>(() => StartupRemoteDataSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<StartupRepository>(() => StartupRepositoryImpl(sl(), sl()));

  // Use Cases
  sl.registerLazySingleton<CheckInternetUseCase>(() =>CheckInternetUseCase(sl()));
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
  sl.registerLazySingleton<GetSavedLanguageUseCase>(()=>GetSavedLanguageUseCase(sl()));
  sl.registerLazySingleton<SaveLanguageUseCase>(() => SaveLanguageUseCase(sl()));

  // Cubit
  sl.registerFactory<LanguageCubit>(() => LanguageCubit(sl(), sl()));
}


// Auth Feature
void _initAuthFeature() {
  // Data Sources
  sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(sl(),sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(()=>AuthRepositoryImpl(sl(),sl()));

  // Use Cases
  sl.registerLazySingleton<CheckLoggedInUseCase>(() => CheckLoggedInUseCase(sl()));
  sl.registerLazySingleton<SignUpWithEmailUseCase>(()=> SignUpWithEmailUseCase(sl()));
  sl.registerLazySingleton<VerifyEmailUseCase>(()=> VerifyEmailUseCase(sl()));
  sl.registerLazySingleton<SignInWithEmailUseCase>(()=> SignInWithEmailUseCase(sl()));
  sl.registerLazySingleton<ChangePasswordUseCase>(()=> ChangePasswordUseCase(sl()));
  sl.registerLazySingleton<RequestResetCodeUseCase>(()=> RequestResetCodeUseCase(sl()));
  sl.registerLazySingleton<VerifyResetCodeUseCase>(()=> VerifyResetCodeUseCase(sl()));
  sl.registerLazySingleton<ResetPasswordUseCase>(()=> ResetPasswordUseCase(sl()));
  sl.registerLazySingleton<LogoutUseCase>(()=>LogoutUseCase(sl(),sl()));

  // Cubit
  sl.registerFactory<AuthCubit>(() => AuthCubit(sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl()));
}

void _initUserFeature(){
  sl.registerLazySingleton<UserLocalDataSource>(()=>UserLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<UserRemoteDataSource>(()=> UserRemoteDataSourceImpl((sl())));

  sl.registerLazySingleton<UserRepository>(()=>UserRepositoryImpl(sl(), sl()));

  sl.registerLazySingleton<GetCurrentUserUseCase>(()=> GetCurrentUserUseCase(sl()));
  sl.registerLazySingleton<CompleteInitialSetupUseCase>(()=> CompleteInitialSetupUseCase(sl()));

  sl.registerFactory<UserCubit>(()=> UserCubit(sl(),sl()));
}

void _initExerciseFeature() {
  sl.registerLazySingleton<ExerciseLocalDataSource>(()=>ExerciseLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<ExerciseRemoteDataSource>(() => ExerciseRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<ExerciseRepository>(() => ExerciseRepositoryImpl(sl(),sl()));
  sl.registerLazySingleton<GetExercisesUseCase>(()=> GetExercisesUseCase(sl()));
  sl.registerLazySingleton<GetExerciseDetailsUseCase>(()=> GetExerciseDetailsUseCase(sl()));
  sl.registerFactory<ExerciseCubit>(()=> ExerciseCubit(sl(),sl()));
}

void _initExercisePlanFeature(){
  sl.registerLazySingleton<ExercisePlanLocalDataSource>(()=> ExercisePlanLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<ExercisePlanRemoteDataSource>(() => ExercisePlanRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<ExercisePlanRepository>(()=> ExercisePlanRepositoryImpl(sl(),sl()));
  sl.registerLazySingleton<GetPlansUseCase>(()=> GetPlansUseCase(sl()));
  sl.registerLazySingleton<GetPlanDetailsUseCase>(()=> GetPlanDetailsUseCase(sl()));
  sl.registerLazySingleton<BookmarkPlanUseCase>(()=> BookmarkPlanUseCase(sl()));
  sl.registerLazySingleton<RemoveBookmarkUseCase>(()=> RemoveBookmarkUseCase(sl()));
  sl.registerLazySingleton<SetCurrentPlanUseCase>(()=> SetCurrentPlanUseCase(sl()));
  sl.registerFactory<ExercisePlanCubit>(() => ExercisePlanCubit(sl(), sl(),sl(),sl(),sl()));

}
