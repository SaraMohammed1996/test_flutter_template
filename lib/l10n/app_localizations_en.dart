// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Test Flutter Template';

  @override
  String get welcome => 'Welcome';

  @override
  String get home => 'Home';

  @override
  String get loading => 'Loading...';

  @override
  String get error => 'Error';

  @override
  String get retry => 'Retry';

  @override
  String get noData => 'No data';

  @override
  String get unknownError => 'An unknown error occurred';

  @override
  String get validationFailed => 'Validation failed';

  @override
  String get subdomainNotSetLoginFirst =>
      'Subdomain not set. Please login first.';

  @override
  String get notAuthenticated => 'Not authenticated';

  @override
  String get invalidDomainError =>
      'Invalid company code. Please check your company code and try again.';

  @override
  String get failedToInitialize => 'Something went wrong. Please try again.';

  @override
  String get failedToConfigureApi => 'Failed to configure. Please try again.';

  @override
  String get noInternetConnection => 'No Internet Connection';

  @override
  String get noInternetConnectionMessage =>
      'Please check your internet connection and try again';

  @override
  String get serverError => 'Server Error';

  @override
  String get serverErrorMessage =>
      'A server error occurred. Please try again later';

  @override
  String get settings => 'Settings';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get arabic => 'العربية';

  @override
  String get login => 'Login';

  @override
  String get register => 'Register';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get name => 'Name';

  @override
  String get passwordConfirmation => 'Confirm Password';

  @override
  String get dontHaveAccount => 'Don\'t have an account? Register';

  @override
  String get alreadyHaveAccount => 'Already have an account? Login';

  @override
  String get products => 'Products';

  @override
  String get profile => 'Profile';

  @override
  String get logout => 'Logout';

  @override
  String get profileUpdatedSuccessfully => 'Profile updated successfully';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get nameRequired => 'Name is required';

  @override
  String get passwordConfirmationRequired =>
      'Password confirmation is required';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String productPrice(String price) {
    return 'Price: $price';
  }

  @override
  String productQuantity(int quantity) {
    return 'Quantity: $quantity';
  }

  @override
  String get searchProducts => 'Search products';

  @override
  String get addProduct => 'Add Product';

  @override
  String get editProduct => 'Edit Product';

  @override
  String get deleteProduct => 'Delete Product';

  @override
  String deleteProductConfirmation(String name) {
    return 'Are you sure you want to delete \"$name\"?';
  }

  @override
  String get description => 'Description';

  @override
  String get price => 'Price';

  @override
  String get quantity => 'Quantity';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get priceRequired => 'Price is required';

  @override
  String get quantityRequired => 'Quantity is required';

  @override
  String get invalidPrice => 'Enter a valid price';

  @override
  String get invalidQuantity => 'Enter a valid quantity';

  @override
  String get productCreatedSuccessfully => 'Product created successfully';

  @override
  String get productUpdatedSuccessfully => 'Product updated successfully';

  @override
  String get productDeletedSuccessfully => 'Product deleted successfully';

  @override
  String get productImage => 'Product Image';

  @override
  String get chooseFromGallery => 'Gallery';

  @override
  String get takePhoto => 'Camera';

  @override
  String get removeImage => 'Remove selected image';

  @override
  String get noProductsYet => 'There are no products yet';
}
