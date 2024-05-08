import 'package:n3imn_project_team/utils/global_exception_hadller/enums/status_exceptoin.dart';

class ExceptionGenarator {
  static AuthResultStatus handleException(e) {
    AuthResultStatus status;
    switch (e.code) {
      case "invalid-email":
        status = AuthResultStatus.invalidEmail;
        break;

      case "firebase_auth/wrong-password":
        status = AuthResultStatus.wrongPassword;
      case "wrong-password":
        status = AuthResultStatus.wrongPassword;
        break;
      case "user-not-found":
        status = AuthResultStatus.userNotFound;
        break;
      case "user-disabled":
        status = AuthResultStatus.userDisabled;
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        status = AuthResultStatus.tooManyRequests;
        break;
      case "operation-not-allowed":
        status = AuthResultStatus.operationNotAllowed;
        break;
      case "email-already-in-use":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      case "invalid-credential":
        status = AuthResultStatus.invalidCredential;
        break;
      case "invalid-verification-code":
        status = AuthResultStatus.invalidVerificationCode;
        break;
      case "invalid-verification-id":
        status = AuthResultStatus.invalidVerificationId;
        break;
      case "auth/invalid-email":
        status = AuthResultStatus.invalidEmail;
        break;
      case "auth/missing-android-pkg-name":
        status = AuthResultStatus
            .missingAndroidPkgName; // You can define a specific status for this case if needed
        break;
      case "auth/missing-continue-uri":
        status = AuthResultStatus
            .missingContinueUri; // You can define a specific status for this case if needed
        break;
      case "auth/missing-ios-bundle-id":
        status = AuthResultStatus
            .missingIosBundleId; // You can define a specific status for this case if needed
        break;
      case "auth/invalid-continue-uri":
        status = AuthResultStatus
            .invalidContinueUri; // You can define a specific status for this case if needed
        break;
      case "auth/unauthorized-continue-uri":
        status = AuthResultStatus
            .unauthorizedContinueUri; // You can define a specific status for this case if needed
        break;
      default:
        status = AuthResultStatus.undefined;
    }
    return status;
  }

  static String generateExceptionMessage(exceptionCode) {
    switch (exceptionCode) {
      case AuthResultStatus.invalidEmail:
        return "Invalid email address.";
      case AuthResultStatus.wrongPassword:
        return "Incorrect password.";
      case AuthResultStatus.userNotFound:
        return "User not found.";
      case AuthResultStatus.userDisabled:
        return "User account has been disabled.";
      case AuthResultStatus.tooManyRequests:
        return "Too many login attempts. Please try again later.";
      case AuthResultStatus.operationNotAllowed:
        return "Operation not allowed.";
      case AuthResultStatus.emailAlreadyExists:
        return "Email address is already in use.";
      case AuthResultStatus.invalidCredential:
        return "Invalid credential.";
      case AuthResultStatus.invalidVerificationCode:
        return "Invalid verification code.";
      case AuthResultStatus.invalidVerificationId:
        return "Invalid verification ID.";
      case AuthResultStatus.missingAndroidPkgName:
        return "Missing Android package name.";
      case AuthResultStatus.missingContinueUri:
        return "A continue URL must be provided in the request.";
      case AuthResultStatus.missingIosBundleId:
        return "An iOS Bundle ID must be provided if an App Store ID is provided.";
      case AuthResultStatus.invalidContinueUri:
        return "The continue URL provided in the request is invalid..";
      case AuthResultStatus.unauthorizedContinueUri:
        return "The domain of the continue URL is not whitelisted. Whitelist the domain in the Firebase console.";
      default:
        return "An undefined error occurred.";
    }
  }
}
