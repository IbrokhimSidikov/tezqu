import 'package:equatable/equatable.dart';
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

  const CollectablesLoaded(this.collectables);

  @override
  List<Object?> get props => [collectables];
}

class CollectablesError extends CollectablesState {
  final String message;

  const CollectablesError(this.message);

  @override
  List<Object?> get props => [message];
}
