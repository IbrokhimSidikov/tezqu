import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecase/use_case.dart';
import '../../domain/usecases/get_collectables.dart';
import 'collectables_state.dart';

@injectable
class CollectablesCubit extends Cubit<CollectablesState> {
  final GetCollectables getCollectables;

  CollectablesCubit(this.getCollectables) : super(CollectablesInitial());

  Future<void> loadCollectables() async {
    emit(CollectablesLoading());

    final result = await getCollectables(NoParams());

    result.fold(
      (failure) => emit(CollectablesError(failure.message)),
      (collectables) => emit(CollectablesLoaded(collectables)),
    );
  }

  Future<void> refreshCollectables() async {
    await loadCollectables();
  }
}
