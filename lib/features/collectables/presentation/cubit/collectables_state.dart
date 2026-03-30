import 'package:equatable/equatable.dart';
import '../../../expense/data/models/payment_method_model.dart';
import '../../domain/entities/collectable_entity.dart';

abstract class CollectablesState extends Equatable {
  const CollectablesState();

  @override
  List<Object?> get props => [];
}

class CollectablesInitial extends CollectablesState {}

class CollectablesLoading extends CollectablesState {}

class CollectablesLoaded extends CollectablesState {
  final CollectablesEntity collectables;
  final List<PaymentMethodModel> paymentMethods;
  final double? pendingCollections;

  const CollectablesLoaded(
    this.collectables, {
    this.paymentMethods = const [],
    this.pendingCollections,
  });

  @override
  List<Object?> get props => [collectables, paymentMethods, pendingCollections];
}

class CollectablesError extends CollectablesState {
  final String message;

  const CollectablesError(this.message);

  @override
  List<Object?> get props => [message];
}
