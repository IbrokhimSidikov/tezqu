import 'package:flutter/services.dart';

/// Date input formatter for DD.MM.YYYY format
/// Automatically adds dots after day and month
/// Limits input to 8 digits (DD.MM.YYYY)
class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Extract only digits
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    
    // Limit to 8 digits (DDMMYYYY)
    if (digitsOnly.length > 8) {
      return oldValue;
    }

    // Build formatted string
    String formatted = '';
    
    if (digitsOnly.isNotEmpty) {
      // Day (first 2 digits)
      formatted += digitsOnly.substring(0, digitsOnly.length.clamp(0, 2));
      
      if (digitsOnly.length > 2) {
        // Add dot after day
        formatted += '.';
        // Month (next 2 digits)
        formatted += digitsOnly.substring(2, digitsOnly.length.clamp(2, 4));
      }
      
      if (digitsOnly.length > 4) {
        // Add dot after month
        formatted += '.';
        // Year (last 4 digits)
        formatted += digitsOnly.substring(4, digitsOnly.length.clamp(4, 8));
      }
    }

    // Calculate cursor position
    int selectionIndex = formatted.length;
    
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
