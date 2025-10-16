import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_dashboard_usecase.dart';
import 'dashboard_state.dart';

@injectable
class DashboardCubit extends Cubit<DashboardState> {
  final GetDashboardUseCase getDashboardUseCase;

  DashboardCubit(this.getDashboardUseCase) : super(DashboardInitial());

  Future<void> loadDashboard() async {
    emit(DashboardLoading());

    final result = await getDashboardUseCase();

    result.fold(
      (failure) => emit(DashboardError(failure.message)),
      (dashboard) => emit(DashboardLoaded(dashboard)),
    );
  }
}
