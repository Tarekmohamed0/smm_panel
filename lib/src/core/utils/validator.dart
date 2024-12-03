class RegexValidator {
  // Regex for email validation
  static final RegExp emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  // Regex for password validation
  static final RegExp passwordRegex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$',
  );

  // Method to validate email
  static String validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email cannot be empty';
    } else if (!emailRegex.hasMatch(email)) {
      if (!email.contains('@')) {
        return 'Email must contain "@" symbol';
      } else if (!email.contains('.')) {
        return 'Email must contain a domain name';
      }
      return 'Invalid email format';
    }
    return 'Valid email';
  }

  // Method to validate password
  static Map<String, dynamic> validatePassword(String password) {
    List<String> errorMessages = [];

    // Check if the password is empty
    if (password.isEmpty) {
      errorMessages.add('Password cannot be empty');
    }

    // Check the length of the password
    if (password.length < 8) {
      errorMessages.add('Password must be at least 8 characters long');
    }

    // Check for uppercase letter
    if (!RegExp(r'.*[A-Z].*').hasMatch(password)) {
      errorMessages.add('Password must contain at least one uppercase letter');
    }

    // Check for lowercase letter
    if (!RegExp(r'.*[a-z].*').hasMatch(password)) {
      errorMessages.add('Password must contain at least one lowercase letter');
    }

    // Check for digit
    if (!RegExp(r'.*\d.*').hasMatch(password)) {
      errorMessages.add('Password must contain at least one digit');
    }

    // Check for special character
    if (!RegExp(r'.*[!@#\$&*~].*').hasMatch(password)) {
      errorMessages.add('Password must contain at least one special character');
    }

    // If there are any error messages, return false with the messages
    if (errorMessages.isNotEmpty) {
      return {'isValid': false, 'messages': errorMessages};
    }

    // If all checks pass
    return {'isValid': true, 'messages': []};
  }
}
