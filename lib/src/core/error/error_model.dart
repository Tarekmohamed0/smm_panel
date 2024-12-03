class ErrorModel {
  final String status;
  final String? message;
  final List<String>? emailErrors;
  final List<String>? passwordErrors;

  ErrorModel({
    required this.status,
    this.message,
    this.emailErrors,
    this.passwordErrors,
  });

  // دالة لتحليل JSON بناءً على اختلاف شكل الاستجابة
  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      status: json['status'] ?? 'error',
      message: json['message'],
      emailErrors: (json['errors']?['email'] as List?)
          ?.map((e) => e.toString())
          .toList(),
      passwordErrors: (json['errors']?['password'] as List?)
          ?.map((e) => e.toString())
          .toList(),
    );
  }

  @override
  String toString() {
    String errors = '';
    if (emailErrors != null && emailErrors!.isNotEmpty) {
      errors += "Email errors: ${emailErrors!.join(", ")} ";
    }
    if (passwordErrors != null && passwordErrors!.isNotEmpty) {
      errors += "Password errors: ${passwordErrors!.join(", ")}";
    }
    return "Status: $status, Message: $message, Errors: $errors";
  }
}
