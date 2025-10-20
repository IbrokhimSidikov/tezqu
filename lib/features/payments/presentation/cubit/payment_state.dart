import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/payment_entity.dart';

part 'payment_state.freezed.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState.initial() = _Initial;
  const factory PaymentState.loading() = _Loading;
  const factory PaymentState.loaded(PaymentsEntity payments) = _Loaded;
  const factory PaymentState.error(String message) = _Error;
}
