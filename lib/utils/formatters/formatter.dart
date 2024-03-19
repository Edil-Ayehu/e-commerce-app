import 'package:intl/intl.dart';

class TFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: "\$").format(amount);
  }

  // static String formatPhoneNumber(String phoneNumber) {
  //   // Assuming a 10 digit US Phone number format (123) 456-7890
  //   if (phoneNumber.length == 10) {
  //     return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
  //   } else if (phoneNumber.length == 11) {
  //     return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
  //   }
  //   // add more custom phone number formatting logic for different formats if needed.
  //   return phoneNumber;
  // }

  static String formatPhoneNumber(String phoneNumber) {
  // Assuming a 10 digit number format (0910111213)
  if (phoneNumber.length == 10) {
    // Prepend the country code and remove any leading zeros
    return '+251${phoneNumber.replaceFirst(RegExp('^0+'), '')}';
  }
  // add more custom phone number formatting logic for different formats if needed.
  return phoneNumber;
}

  // Nof fully tested
  // static String internationalFormatPhoneNumber(String phoneNumber) {
  //   // remove any non-digit characters from the phone number
  //   var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

  //   // extract the count code from the digitsOnly
  //   String countryCode = '+${digitsOnly.substring(0, 2)}';
  //   digitsOnly = digitsOnly.substring(2);

  //   // add the remaining digits with proper formatting
  //   final formattedNumber = StringBuffer();
  //   formattedNumber.write('($countryCode)');

  //   int i = 0;
  //   while (i < digitsOnly.length) {
  //     int groupLength = 2;
  //     if (i == 0 && countryCode == '+251') {
  //       groupLength = 3;
  //     }

  //     int end = i + groupLength;
  //     formattedNumber.write(digitsOnly.substring(i, end));

  //     if (end < digitsOnly.length) {
  //       formattedNumber.write(' ');
  //     }
  //     i = end;
  //   }
  // }
}
