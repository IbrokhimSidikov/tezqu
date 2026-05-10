import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../expense/data/models/payment_method_model.dart';

class CollectPaymentDialog extends StatefulWidget {
  final double amount;
  final List<PaymentMethodModel> paymentMethods;

  const CollectPaymentDialog({
    super.key,
    required this.amount,
    required this.paymentMethods,
  });

  @override
  State<CollectPaymentDialog> createState() => _CollectPaymentDialogState();
}

class _CollectPaymentDialogState extends State<CollectPaymentDialog> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _reasonController = TextEditingController();

  String? _selectedPaymentMethodId;
  DateTime _selectedDate = DateTime.now();

  /// Whether the user wants to delay the ENTIRE payment (collect nothing).
  bool _delayAll = false;

  /// Delay date chosen by the user.
  DateTime? _delayDate;

  /// Whether the entered amount is less than the full amount.
  bool get _isPartial {
    if (_delayAll) return false;
    final value = double.tryParse(_amountController.text);
    if (value == null) return false;
    return value < widget.amount && value > 0;
  }

  /// Whether the delay section should be visible.
  bool get _showDelaySection => _delayAll || _isPartial;

  /// Max allowed delay date = today + 1 month.
  DateTime get _maxDelayDate {
    final now = DateTime.now();
    return DateTime(now.year, now.month + 1, now.day);
  }

  @override
  void initState() {
    super.initState();
    _amountController.text = _formatAmount(widget.amount);
    _amountController.addListener(() => setState(() {}));

    final cashMethod = widget.paymentMethods
        .where((m) => m.name.toUpperCase() == 'NAQD')
        .firstOrNull;
    if (cashMethod != null) _selectedPaymentMethodId = cashMethod.id;
  }

  @override
  void dispose() {
    _amountController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  String _formatAmount(double amount) {
    if (amount == amount.toInt()) return amount.toInt().toString();
    return amount.toStringAsFixed(2);
  }

  String _formatDate(DateTime date) => DateFormat('MMM dd, yyyy').format(date);

  Future<void> _pickDelayDate(BuildContext context) async {
    final now = DateTime.now();
    final initial = _delayDate ?? now.add(const Duration(days: 1));
    final clamped =
        initial.isAfter(_maxDelayDate) ? _maxDelayDate : initial;
    final picked = await showDatePicker(
      context: context,
      initialDate: clamped,
      firstDate: now.add(const Duration(days: 1)),
      lastDate: _maxDelayDate,
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(
          colorScheme: const ColorScheme.light(
            primary: Colors.orange,
            onPrimary: Colors.white,
            onSurface: AppColors.cxBlack,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => _delayDate = picked);
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final result = <String, dynamic>{
      'payment_method_id': _selectedPaymentMethodId,
      'payment_date': _selectedDate.toIso8601String(),
      'delay_all': _delayAll,
      'has_delay': _showDelaySection,
      'amount': _delayAll ? 0.0 : double.parse(_amountController.text),
    };

    if (_showDelaySection) {
      result['delay_until'] = DateFormat('yyyy-MM-dd').format(_delayDate!);
      result['delay_reason'] = _reasonController.text.trim();
    }

    Navigator.of(context).pop(result);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Dialog(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Title ──
              Text(
                l10n.collectPayment,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.cxBlack,
                ),
              ),
              SizedBox(height: 16.h),

              // ── Delay entire payment toggle ──
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: _delayAll
                      ? Colors.orange.shade50
                      : Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: _delayAll
                        ? Colors.orange.shade300
                        : Colors.grey.shade200,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.schedule,
                        size: 18.sp,
                        color: _delayAll
                            ? Colors.orange.shade600
                            : Colors.grey.shade500),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        l10n.delayEntirePayment,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: _delayAll
                              ? Colors.orange.shade700
                              : AppColors.cxBlack,
                        ),
                      ),
                    ),
                    Switch(
                      value: _delayAll,
                      activeColor: Colors.orange.shade600,
                      onChanged: (val) {
                        setState(() {
                          _delayAll = val;
                          if (val) {
                            _amountController.text =
                                _formatAmount(widget.amount);
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),

              // ── Amount field (hidden when delay-all) ──
              if (!_delayAll) ...[
                Text(
                  l10n.amount,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.cxBlack,
                  ),
                ),
                SizedBox(height: 8.h),
                TextFormField(
                  controller: _amountController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  style: TextStyle(
                      fontSize: 20.sp, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    hintText: '0',
                    prefixText: '\$ ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide:
                          BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide:
                          BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(
                          color: AppColors.cx78D9BF, width: 2),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w, vertical: 12.h),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter amount';
                    }
                    final amt = double.tryParse(value);
                    if (amt == null) return 'Please enter a valid number';
                    if (amt > widget.amount) {
                      return 'Amount exceeds remaining \$${_formatAmount(widget.amount)}';
                    }
                    if (amt <= 0) return 'Amount must be greater than zero';
                    return null;
                  },
                ),

                // Partial-payment info banner
                if (_isPartial) ...[
                  SizedBox(height: 8.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 12.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(8.r),
                      border:
                          Border.all(color: Colors.orange.shade200),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.info_outline,
                            size: 16.sp,
                            color: Colors.orange.shade600),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            l10n.partialPaymentInfo,
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.orange.shade700),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],

              // ── Delay section ──
              if (_showDelaySection) ...[
                SizedBox(height: 20.h),
                Divider(color: Colors.orange.shade200, height: 1),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Icon(Icons.schedule,
                        size: 16.sp, color: Colors.orange.shade600),
                    SizedBox(width: 6.w),
                    Text(
                      _delayAll
                          ? l10n.delayPayment
                          : l10n.delayRemainingAmount,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange.shade700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),

                // Remaining amount chip (partial mode only)
                if (_isPartial) ...[
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      '${l10n.remainingAmount}: \$ ${_formatAmount(widget.amount - (double.tryParse(_amountController.text) ?? 0))}',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange.shade800,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                ],

                // Delay date picker
                Text(
                  l10n.delayUntil,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.cxBlack,
                  ),
                ),
                SizedBox(height: 6.h),
                FormField<DateTime>(
                  validator: (_) {
                    if (_delayDate == null) return l10n.pleaseSelectDate;
                    if (_delayDate!.isAfter(_maxDelayDate)) {
                      return l10n.maxDelayOneMonth;
                    }
                    return null;
                  },
                  builder: (field) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => _pickDelayDate(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 12.h),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: field.hasError
                                  ? Colors.red.shade400
                                  : Colors.orange.shade300,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_today,
                                  size: 18.sp,
                                  color: Colors.orange.shade600),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Text(
                                  _delayDate != null
                                      ? _formatDate(_delayDate!)
                                      : l10n.selectDelayDate,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: _delayDate != null
                                        ? AppColors.cxBlack
                                        : Colors.grey.shade500,
                                  ),
                                ),
                              ),
                              Text(
                                'max 1 month',
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.orange.shade400),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (field.hasError)
                        Padding(
                          padding:
                              EdgeInsets.only(top: 4.h, left: 4.w),
                          child: Text(
                            field.errorText!,
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.red.shade600),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),

                // Delay reason
                Text(
                  l10n.delayReason,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.cxBlack,
                  ),
                ),
                SizedBox(height: 6.h),
                TextFormField(
                  controller: _reasonController,
                  maxLines: 3,
                  style: TextStyle(fontSize: 13.sp),
                  decoration: InputDecoration(
                    hintText: l10n.delayReasonHint,
                    hintStyle: TextStyle(
                        fontSize: 12.sp, color: Colors.grey.shade400),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide:
                          BorderSide(color: Colors.orange.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide:
                          BorderSide(color: Colors.orange.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                          color: Colors.orange.shade600, width: 2),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 12.w, vertical: 10.h),
                  ),
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) {
                      return l10n.pleaseEnterReason;
                    }
                    return null;
                  },
                ),
              ],

              SizedBox(height: 24.h),

              // ── Action buttons ──
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
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _delayAll
                            ? Colors.orange.shade600
                            : AppColors.cxBlack,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        _delayAll
                            ? l10n.confirmDelay
                            : l10n.confirmPayment,
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
    );
  }
}
