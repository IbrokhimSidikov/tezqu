import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/delete_account_usecase.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final DeleteAccountUseCase deleteAccountUseCase;

  ProfileCubit(this.deleteAccountUseCase) : super(const ProfileState.initial());

  Future<void> deleteAccount(String userId) async {
    emit(const ProfileState.loading());

    final result = await deleteAccountUseCase(userId);

    result.fold(
      (failure) => emit(ProfileState.error(failure.message)),
      (_) => emit(const ProfileState.accountDeleted()),
    );
  }
}
