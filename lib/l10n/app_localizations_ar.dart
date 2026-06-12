// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'قالب Flutter تجريبي';

  @override
  String get welcome => 'مرحبا';

  @override
  String get home => 'الرئيسية';

  @override
  String get loading => 'جاري التحميل...';

  @override
  String get error => 'خطأ';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get noData => 'لا توجد بيانات';

  @override
  String get unknownError => 'حدث خطأ غير معروف';

  @override
  String get validationFailed => 'فشل التحقق';

  @override
  String get subdomainNotSetLoginFirst =>
      'لم يتم تعيين النطاق الفرعي. يرجى تسجيل الدخول أولاً.';

  @override
  String get notAuthenticated => 'غير مصادق';

  @override
  String get invalidDomainError =>
      'رمز الشركة غير صالح. يرجى التحقق من رمز الشركة والمحاولة مرة أخرى.';

  @override
  String get failedToInitialize => 'حدث خطأ ما. يرجى المحاولة مرة أخرى.';

  @override
  String get failedToConfigureApi => 'فشل في التكوين. يرجى المحاولة مرة أخرى.';

  @override
  String get noInternetConnection => 'لا يوجد اتصال بالإنترنت';

  @override
  String get noInternetConnectionMessage =>
      'يرجى التحقق من اتصال الإنترنت والمحاولة مرة أخرى';

  @override
  String get serverError => 'خطأ في الخادم';

  @override
  String get serverErrorMessage => 'حدث خطأ في الخادم. يرجى المحاولة لاحقاً';

  @override
  String get settings => 'الإعدادات';

  @override
  String get darkMode => 'الوضع الداكن';

  @override
  String get language => 'اللغة';

  @override
  String get english => 'English';

  @override
  String get arabic => 'العربية';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get register => 'إنشاء حساب';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get name => 'الاسم';

  @override
  String get passwordConfirmation => 'تأكيد كلمة المرور';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟ سجل الآن';

  @override
  String get alreadyHaveAccount => 'لديك حساب بالفعل؟ سجل الدخول';

  @override
  String get products => 'المنتجات';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get profileUpdatedSuccessfully => 'تم تحديث الملف الشخصي بنجاح';

  @override
  String get emailRequired => 'البريد الإلكتروني مطلوب';

  @override
  String get passwordRequired => 'كلمة المرور مطلوبة';

  @override
  String get nameRequired => 'الاسم مطلوب';

  @override
  String get passwordConfirmationRequired => 'تأكيد كلمة المرور مطلوب';

  @override
  String get passwordsDoNotMatch => 'كلمات المرور غير متطابقة';

  @override
  String productPrice(String price) {
    return 'السعر: $price';
  }

  @override
  String productQuantity(int quantity) {
    return 'الكمية: $quantity';
  }

  @override
  String get searchProducts => 'بحث في المنتجات';

  @override
  String get addProduct => 'إضافة منتج';

  @override
  String get editProduct => 'تعديل منتج';

  @override
  String get deleteProduct => 'حذف منتج';

  @override
  String deleteProductConfirmation(String name) {
    return 'هل أنت متأكد من حذف \"$name\"؟';
  }

  @override
  String get description => 'الوصف';

  @override
  String get price => 'السعر';

  @override
  String get quantity => 'الكمية';

  @override
  String get save => 'حفظ';

  @override
  String get cancel => 'إلغاء';

  @override
  String get delete => 'حذف';

  @override
  String get priceRequired => 'السعر مطلوب';

  @override
  String get quantityRequired => 'الكمية مطلوبة';

  @override
  String get invalidPrice => 'أدخل سعراً صالحاً';

  @override
  String get invalidQuantity => 'أدخل كمية صالحة';

  @override
  String get productCreatedSuccessfully => 'تم إنشاء المنتج بنجاح';

  @override
  String get productUpdatedSuccessfully => 'تم تحديث المنتج بنجاح';

  @override
  String get productDeletedSuccessfully => 'تم حذف المنتج بنجاح';

  @override
  String get productImage => 'صورة المنتج';

  @override
  String get chooseFromGallery => 'المعرض';

  @override
  String get takePhoto => 'التقاط صورة';

  @override
  String get removeImage => 'إزالة الصورة المحددة';

  @override
  String get noProductsYet => 'لا توجد منتجات بعد';
}
