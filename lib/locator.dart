import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/utils/prefs_opreator.dart';
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

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerSingleton<DioClient>(DioClient());

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);
  sl.registerSingleton<PrefsOperator>(PrefsOperator());

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
