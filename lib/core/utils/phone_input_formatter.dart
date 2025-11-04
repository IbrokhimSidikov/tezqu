import 'package:flutter/services.dart';

/// Phone input formatter for Uzbekistan phone numbers
/// Format: +998 XX XXX XX XX
/// Limits input to 9 digits after +998
class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Always maintain the prefix
    const prefix = '+998 ';
    
    // If user tries to delete the prefix, restore it
    if (!newValue.text.startsWith(prefix)) {
      return TextEditingValue(
        text: prefix,
        selection: TextSelection.collapsed(offset: prefix.length),
      );
    }

    // Extract only digits after the prefix
    final digitsOnly = newValue.text.substring(prefix.length).replaceAll(RegExp(r'[^0-9]'), '');
    
    // Limit to 9 digits
    if (digitsOnly.length > 9) {
      return oldValue;
    }

    // Build formatted string
    String formatted = prefix;
    
    if (digitsOnly.isNotEmpty) {
      // First 2 digits (code)
      formatted += digitsOnly.substring(0, digitsOnly.length.clamp(0, 2));
      
      if (digitsOnly.length > 2) {
        // Add space after code
        formatted += ' ';
        // Next 3 digits
        formatted += digitsOnly.substring(2, digitsOnly.length.clamp(2, 5));
      }
      
      if (digitsOnly.length > 5) {
        // Add space
        formatted += ' ';
        // Next 2 digits
        formatted += digitsOnly.substring(5, digitsOnly.length.clamp(5, 7));
      }
      
      if (digitsOnly.length > 7) {
        // Add space
        formatted += ' ';
        // Last 2 digits
        formatted += digitsOnly.substring(7, digitsOnly.length.clamp(7, 9));
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
