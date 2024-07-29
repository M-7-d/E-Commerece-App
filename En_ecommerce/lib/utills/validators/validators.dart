class TValidators {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is Required';
    }

    final emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid Email Address.';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is Required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 charecters long';
    }
    if (value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at Least one Uppercase Letter';
    }
    if (value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at Least one Number';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'PhoneNumber is Required';
    }
    final phoneReqExp = RegExp(r'^\d{10}$');

    if (!phoneReqExp.hasMatch(value)) {
      return 'Invalid PhoneNumber Format (10 digits Required)';
    }
    return null;
  }
}
