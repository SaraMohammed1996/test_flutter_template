import 'package:test_flutter_template/l10n/app_localizations.dart';

/// Helper class to detect network-related errors and provide user-friendly messages.
class NetworkErrorHelper {
  static const List<String> _networkErrorPatterns = [
    'socketexception',
    'failed host lookup',
    'name or service not known',
    'connection refused',
    'network is unreachable',
    'no address associated with hostname',
    'connection timed out',
    'host lookup failed',
    'no internet',
    'network error',
    'clientexception',
    'handshake',
    'connection reset',
    'connection closed',
    'errno',
    'os error',
  ];

  static const List<String> _serverErrorPatterns = [
    '500',
    '502',
    '503',
    '504',
    'internal server error',
    'bad gateway',
    'service unavailable',
    'gateway timeout',
  ];

  static bool isNetworkError(dynamic error) {
    if (error == null) return false;
    final errorMessage = error.toString().toLowerCase();
    for (final pattern in _networkErrorPatterns) {
      if (errorMessage.contains(pattern)) {
        return true;
      }
    }
    return false;
  }

  static bool isServerError(dynamic error) {
    if (error == null) return false;
    final errorMessage = error.toString().toLowerCase();
    for (final pattern in _serverErrorPatterns) {
      if (errorMessage.contains(pattern)) {
        return true;
      }
    }
    return false;
  }

  static String getDisplayError(String message, AppLocalizations l10n) {
    if (message == 'An error occurred') {
      return l10n.unknownError;
    }
    if (message == 'Validation failed') {
      return l10n.validationFailed;
    }
    if (message == 'Subdomain not set. User must login first.' ||
        message == 'Subdomain not set. Please login first.' ||
        message ==
            'Base URL is required. Subdomain must be set before creating API client.') {
      return l10n.subdomainNotSetLoginFirst;
    }
    if (message == 'Not authenticated') {
      return l10n.notAuthenticated;
    }
    if (message == 'INVALID_DOMAIN_ERROR') {
      return l10n.invalidDomainError;
    }
    if (message.startsWith('Failed to initialize:')) {
      return l10n.failedToInitialize;
    }
    if (message.startsWith('Failed to configure API:')) {
      return l10n.failedToConfigureApi;
    }
    return getDisplayMessage(message, l10n);
  }

  static String getDisplayMessage(String errorMessage, AppLocalizations l10n) {
    final lowerMessage = errorMessage.toLowerCase();

    for (final pattern in _networkErrorPatterns) {
      if (lowerMessage.contains(pattern)) {
        return l10n.noInternetConnectionMessage;
      }
    }

    for (final pattern in _serverErrorPatterns) {
      if (lowerMessage.contains(pattern)) {
        return l10n.serverErrorMessage;
      }
    }

    return errorMessage;
  }

  static String getErrorTitle(String errorMessage, AppLocalizations l10n) {
    final lowerMessage = errorMessage.toLowerCase();

    for (final pattern in _networkErrorPatterns) {
      if (lowerMessage.contains(pattern)) {
        return l10n.noInternetConnection;
      }
    }

    for (final pattern in _serverErrorPatterns) {
      if (lowerMessage.contains(pattern)) {
        return l10n.serverError;
      }
    }

    return l10n.error;
  }
}
