import 'package:intl/intl.dart';

class Formatters {
  // تنسيق التاريخ (إلى النص)
  static String formatDate(DateTime date, {String format = 'yyyy-MM-dd'}) {
    try {
      return DateFormat(format).format(date);
    } catch (e) {
      return 'Invalid date';
    }
  }

  // تنسيق النصوص (تحويل النصوص إلى Title Case)
  static String toTitleCase(String text) {
    if (text.isEmpty) return '';
    return text
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }

  // تنسيق الأرقام (إضافة فاصلة لكل 3 أرقام)
  static String formatNumber(num number) {
    final formatter = NumberFormat('#,##0', 'en_US');
    return formatter.format(number);
  }

  // تنسيق العملات
  static String formatCurrency(num amount,
      {String locale = 'en_US', String symbol = '\$'}) {
    final formatter = NumberFormat.currency(locale: locale, symbol: symbol);
    return formatter.format(amount);
  }

  // تحويل النصوص إلى الحروف الكبيرة (UPPERCASE)
  static String toUpperCase(String text) => text.toUpperCase();

  // تحويل النصوص إلى الحروف الصغيرة (lowercase)
  static String toLowerCase(String text) => text.toLowerCase();

  // تحويل النصوص إلى صيغة Slug (لـ URL أو روابط)
  static String toSlug(String text) {
    return text
        .trim()
        .toLowerCase()
        .replaceAll(RegExp(r'[^\w\s-]'), '') // إزالة الرموز غير المسموح بها
        .replaceAll(RegExp(r'\s+'), '-') // استبدال المسافات بـ "-"
        .replaceAll(RegExp(r'-+'), '-'); // إزالة "-" الزائدة
  }
}
