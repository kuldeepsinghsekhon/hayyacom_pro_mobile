class FormValidation {
  static String? phoneValidation(String? number) {
    if(number?.trim().isEmpty ?? false) {
      return "Please provide phone number";
    } else if ((number?.trim().length ?? 0) < 10) {
      return "Please provide valid phone number";
    } else {
      return null;
    }
  }

  static String? passwordValidation(String? password) {
    if(password?.trim().isEmpty ?? false) {
      return "Please provide password";
    } else if ((password?.trim().length ?? 0) < 3) {
      return "Password must not less then 3 characters";
    } else {
      return null;
    }
  }

  static String? eventValidation(String? eventId) {
    if(eventId?.trim().isEmpty ?? false) {
      return "Please provide valid event-id";
    } else {
      return null;
    }
  }
}