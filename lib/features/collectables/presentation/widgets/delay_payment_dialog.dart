import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../l10n/app_localizations.dart';

class DelayPaymentDialog extends StatefulWidget {
  const DelayPaymentDialog({super.key});

  @override
  State<DelayPaymentDialog> createState() => _DelayPaymentDialogState();
}

class _DelayPaymentDialogState extends State<DelayPaymentDialog> {
  final _formKey = GlobalKey<FormState>();
  final _reasonController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  Future<void> _selectDate(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final today = DateTime.now();
    final maxDate = DateTime(today.year, today.month + 1, today.day);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? today.add(const Duration(days: 1)),
      firstDate: today.add(const Duration(days: 1)),
      lastDate: maxDate,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.cx78D9BF,
              onPrimary: AppColors.cxWhite,
              onSurface: AppColors.cxBlack,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24.w),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title row
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        Icons.schedule,
                        color: Colors.orange.shade600,
                        size: 22.sp,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      l10n.delayPayment,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.cxBlack,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  l10n.selectDelayDate,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 24.h),

                // Delay Until Date Picker
                Text(
                  l10n.delayUntil,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.cxBlack,
                  ),
                ),
                SizedBox(height: 8.h),
                FormField<DateTime>(
                  validator: (_) {
                    if (_selectedDate == null) {
                      return l10n.pleaseSelectDate;
                    }
                    final maxDate = DateTime.now().add(const Duration(days: 31));
                    if (_selectedDate!.isAfter(maxDate)) {
                      return l10n.maxDelayOneMonth;
                    }
                    return null;
                  },
                  builder: (field) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () async {
                            await _selectDate(context);
                            field.didChange(_selectedDate);
                          },
                          borderRadius: BorderRadius.circular(8.r),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 14.h),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: field.hasError
                                    ? Colors.red.shade400
                                    : _selectedDate != null
                                        ? AppColors.cx78D9BF
                                        : Colors.grey.shade300,
                                width: _selectedDate != null ? 1.5 : 1,
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_month_outlined,
                                  size: 20.sp,
                                  color: _selectedDate != null
                                      ? AppColors.cx78D9BF
                                      : Colors.grey.shade500,
                                ),
                                SizedBox(width: 12.w),
                                Text(
                                  _selectedDate != null
                                      ? _formatDate(_selectedDate!)
                                      : l10n.selectDelayDate,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: _selectedDate != null
                                        ? AppColors.cxBlack
                                        : Colors.grey.shade500,
                                    fontWeight: _selectedDate != null
                                        ? FontWeight.w500
                                        : FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (field.hasError)
                          Padding(
                            padding: EdgeInsets.only(top: 6.h, left: 4.w),
                            child: Text(
                              field.errorText!,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.red.shade600,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 8.h),
                // Helper text showing max allowed date
                Row(
                  children: [
                    Icon(Icons.info_outline,
                        size: 13.sp, color: Colors.grey.shade500),
                    SizedBox(width: 4.w),
                    Text(
                      l10n.maxDelayOneMonth,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                // Delay Reason
                Text(
                  l10n.delayReason,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.cxBlack,
                  ),
                ),
                SizedBox(height: 8.h),
                TextFormField(
                  controller: _reasonController,
                  maxLines: 3,
                  textCapitalization: TextCapitalization.sentences,
                  style: TextStyle(fontSize: 14.sp),
                  decoration: InputDecoration(
                    hintText: l10n.delayReasonHint,
                    hintStyle: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey.shade400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide:
                          const BorderSide(color: AppColors.cx78D9BF, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: Colors.red.shade400),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: Colors.red.shade400, width: 2),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w, vertical: 12.h),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return l10n.pleaseEnterReason;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 28.h),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.grey.shade400),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Text(
                          l10n.cancel,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.cxBlack,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final formatted =
                                DateFormat('yyyy-MM-dd').format(_selectedDate!);
                            Navigator.of(context).pop({
                              'delay_until': formatted,
                              'delay_reason': _reasonController.text.trim(),
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.shade600,
                          foregroundColor: AppColors.cxWhite,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Text(
                          l10n.confirmDelay,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

