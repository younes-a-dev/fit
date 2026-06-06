// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get emailAddress => 'آدرس ایمیل';

  @override
  String get confirmPassword => 'تکرار رمز عبور';

  @override
  String get forgotPassword => 'رمز عبور را فراموش کرده‌اید؟';

  @override
  String get dontHaveAccount => ' حساب کاربری ندارید؟ ';

  @override
  String get haveAccount => ' قبلاً حساب کاربری ساخته‌اید؟ ';

  @override
  String get error => 'خطا';

  @override
  String get checkYourEmail => 'ایمیل خود را بررسی کنید';

  @override
  String get verificationCodeSent => 'کد تایید ۶ رقمی به ارسال شد';

  @override
  String get signInTitle => 'ورود';

  @override
  String get signUpTitle => 'ثبت نام';

  @override
  String get forgotYourPassword => 'رمز عبور خود را فراموش کرده‌اید؟';

  @override
  String get resetPasswordDescription =>
      'ایمیل ثبت‌شده خود را وارد کنید تا کد بازیابی رمز عبور برای شما ارسال شود.';

  @override
  String get send => 'ارسال';

  @override
  String get resetCodeSent => 'کد بازیابی رمز عبور به آدرس ایمیل شما ارسال شد';

  @override
  String get verifyCodeDescription =>
      'لطفاً کد تایید ارسال‌شده به آدرس زیر را وارد کنید';

  @override
  String get confirm => 'تایید';

  @override
  String get verificationCodeRequired => 'وارد کردن کد تایید الزامی است';

  @override
  String get verificationCodeLength => 'کد تایید باید ۶ رقمی باشد';

  @override
  String get verificationCodeNumbersOnly => 'کد تایید فقط باید شامل اعداد باشد';

  @override
  String get invalidCode => 'کد نامعتبر';

  @override
  String get invalidCodeMessage => 'لطفاً کد تایید صحیح را وارد کنید';

  @override
  String get createNewPassword => 'رمز عبور جدید ایجاد کنید';

  @override
  String get createNewPasswordDescription =>
      'رمز عبور جدید خود را وارد کنید. مطمئن شوید که امن بوده و به خاطر سپردن آن برای شما آسان است.';

  @override
  String get newPassword => 'رمز عبور جدید';

  @override
  String get confirmNewPassword => 'تکرار رمز عبور جدید';

  @override
  String get passwordChangedSuccessfully => 'رمز عبور با موفقیت تغییر کرد';

  @override
  String get passwordChangedSuccessfullyMessage =>
      'رمز عبور شما با موفقیت به‌روزرسانی شد. اکنون می‌توانید با رمز عبور جدید وارد شوید.';

  @override
  String get passwordChangeFailed => 'مشکلی پیش آمد';

  @override
  String get passwordChangeFailedMessage =>
      'امکان تغییر رمز عبور وجود ندارد. لطفاً دوباره تلاش کنید.';

  @override
  String get emailRequired => 'وارد کردن ایمیل الزامی است';

  @override
  String get invalidEmail => 'لطفاً یک ایمیل معتبر وارد کنید';

  @override
  String get passwordRequired => 'وارد کردن رمز عبور الزامی است';

  @override
  String get passwordMinLength => 'رمز عبور باید حداقل ۸ کاراکتر باشد';

  @override
  String get passwordUppercase => 'رمز عبور باید حداقل یک حرف بزرگ داشته باشد';

  @override
  String get passwordNumber => 'رمز عبور باید حداقل یک عدد داشته باشد';

  @override
  String get confirmPasswordRequired => 'لطفاً رمز عبور را تکرار کنید';

  @override
  String get passwordsDoNotMatch => 'رمزهای عبور مطابقت ندارند';

  @override
  String fieldRequired(Object fieldName) {
    return '$fieldName الزامی است';
  }

  @override
  String get next => 'بعدی';

  @override
  String get back => 'قبلی';

  @override
  String get ok => 'تایید';

  @override
  String get chooseLanguage => 'انتخاب زبان';

  @override
  String get appName => 'اپلیکیشن ورزشی';

  @override
  String get welcome => 'خوش آمدید';

  @override
  String get signIn => 'ورود';

  @override
  String get signUp => 'ثبت نام';

  @override
  String get email => 'ایمیل';

  @override
  String get password => 'رمز عبور';

  @override
  String get username => 'نام کاربری';

  @override
  String get gender => 'جنسیت';

  @override
  String get male => 'مرد';

  @override
  String get female => 'زن';

  @override
  String get other => 'سایر';

  @override
  String get weekStartDay => 'اولین روز هفته';

  @override
  String get monday => 'دوشنبه';

  @override
  String get saturday => 'شنبه';

  @override
  String get sunday => 'یکشنبه';

  @override
  String get go => 'ادامه';

  @override
  String get home => 'خانه';

  @override
  String get discover => 'کشف';

  @override
  String get createPlan => 'ساخت برنامه';

  @override
  String get profile => 'پروفایل';

  @override
  String get coach => 'مربی';

  @override
  String get students => 'شاگردان';

  @override
  String get findCoach => 'پیدا کردن مربی';
}
