// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/data/datasources/auth_local_data_source.dart'
    as _i852;
import '../../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i107;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/logout_usecase.dart' as _i48;
import '../../features/auth/domain/usecases/register_usecase.dart' as _i941;
import '../../features/auth/domain/usecases/send_code_usecase.dart' as _i789;
import '../../features/auth/domain/usecases/send_login_code_usecase.dart'
    as _i1008;
import '../../features/auth/domain/usecases/verify_usecase.dart' as _i778;
import '../../features/auth/presentation/cubits/auth_cubit.dart' as _i521;
import '../../features/contracts/data/datasources/contract_remote_data_source.dart'
    as _i902;
import '../../features/contracts/data/repositories/contract_repository_impl.dart'
    as _i141;
import '../../features/contracts/domain/repositories/contract_repository.dart'
    as _i841;
import '../../features/contracts/domain/usecases/accept_contract.dart' as _i432;
import '../../features/contracts/domain/usecases/get_contracts.dart' as _i609;
import '../../features/contracts/domain/usecases/reject_contract.dart' as _i594;
import '../../features/contracts/presentation/cubit/contract_cubit.dart'
    as _i1055;
import '../../features/expense/data/datasources/expense_remote_data_source.dart'
    as _i66;
import '../../features/expense/data/repositories/expense_repository_impl.dart'
    as _i587;
import '../../features/expense/domain/repositories/expense_repository.dart'
    as _i31;
import '../../features/expense/presentation/cubit/expense_cubit.dart' as _i501;
import '../../features/home/data/datasources/dashboard_remote_data_source.dart'
    as _i640;
import '../../features/home/data/repositories/dashboard_repository_impl.dart'
    as _i1057;
import '../../features/home/domain/repositories/dashboard_repository.dart'
    as _i386;
import '../../features/home/domain/usecases/get_dashboard_usecase.dart'
    as _i814;
import '../../features/home/presentation/cubit/dashboard_cubit.dart' as _i989;
import '../../features/home/presentation/cubit/wishlist_cubit.dart' as _i968;
import '../../features/income/data/datasources/income_remote_data_source.dart'
    as _i610;
import '../../features/income/data/repositories/income_repository_impl.dart'
    as _i324;
import '../../features/income/domain/repositories/income_repository.dart'
    as _i260;
import '../../features/income/domain/usecases/add_to_wishlist_usecase.dart'
    as _i1007;
import '../../features/income/domain/usecases/get_income_detail_usecase.dart'
    as _i1004;
import '../../features/income/domain/usecases/get_income_sources_usecase.dart'
    as _i263;
import '../../features/income/presentation/cubit/income_cubit.dart' as _i1006;
import '../../features/onboard/presentation/cubit/splash_screen_cubit.dart'
    as _i243;
import '../../features/payments/data/datasources/payment_remote_data_source.dart'
    as _i49;
import '../../features/payments/data/repositories/payment_repository_impl.dart'
    as _i842;
import '../../features/payments/domain/repositories/payment_repository.dart'
    as _i315;
import '../../features/payments/domain/usecases/get_payments_usecase.dart'
    as _i645;
import '../../features/payments/presentation/cubit/payment_cubit.dart' as _i782;
import '../../features/products/data/repositories/product_repository_impl.dart'
    as _i764;
import '../../features/products/domain/repositories/product_repository.dart'
    as _i963;
import '../../features/products/presentation/cubit/product_cubit.dart' as _i661;
import '../../features/profile/data/datasources/profile_remote_data_source.dart'
    as _i847;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i334;
import '../../features/profile/domain/repositories/profile_repository.dart'
    as _i894;
import '../../features/profile/domain/usecases/delete_account_usecase.dart'
    as _i1056;
import '../../features/profile/presentation/cubit/profile_cubit.dart' as _i36;
import '../../features/warehouse/data/repositories/warehouse_repository_impl.dart'
    as _i413;
import '../../features/warehouse/domain/repositories/warehouse_repository.dart'
    as _i624;
import '../../features/warehouse/presentation/cubit/add_product_cubit.dart'
    as _i279;
import '../../features/warehouse/presentation/cubit/warehouse_cubit.dart'
    as _i410;
import '../network/dio_client.dart' as _i667;
import '../network/network_info.dart' as _i932;
import '../network/network_module.dart' as _i200;
import '../services/category_cache_service.dart' as _i1013;
import '../services/expense_service.dart' as _i986;
import '../services/product_request_service.dart' as _i287;
import '../services/storage_service.dart' as _i306;
import '../services/wishlist_service.dart' as _i203;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    final networkModule = _$NetworkModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i1013.CategoryCacheService>(
      () => _i1013.CategoryCacheService(),
    );
    gh.lazySingleton<_i306.StorageService>(
      () => _i306.StorageServiceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i932.NetworkInfo>(
      () => networkModule.networkInfo(gh<_i895.Connectivity>()),
    );
    gh.lazySingleton<_i667.DioClient>(
      () => _i667.DioClient(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i49.PaymentRemoteDataSource>(
      () => _i49.PaymentRemoteDataSourceImpl(gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i986.ExpenseService>(
      () => _i986.ExpenseService(gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i287.ProductRequestService>(
      () => _i287.ProductRequestService(gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i203.WishlistService>(
      () => _i203.WishlistService(gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i610.IncomeRemoteDataSource>(
      () => _i610.IncomeRemoteDataSourceImpl(gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i66.ExpenseRemoteDataSource>(
      () => _i66.ExpenseRemoteDataSourceImpl(gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i852.AuthLocalDataSource>(
      () => _i852.AuthLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i624.WarehouseRepository>(
      () => _i413.WarehouseRepositoryImpl(gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i31.ExpenseRepository>(
      () => _i587.ExpenseRepositoryImpl(gh<_i66.ExpenseRemoteDataSource>()),
    );
    gh.lazySingleton<_i315.PaymentRepository>(
      () => _i842.PaymentRepositoryImpl(gh<_i49.PaymentRemoteDataSource>()),
    );
    gh.lazySingleton<_i847.ProfileRemoteDataSource>(
      () => _i847.ProfileRemoteDataSourceImpl(gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i645.GetPaymentsUseCase>(
      () => _i645.GetPaymentsUseCase(gh<_i315.PaymentRepository>()),
    );
    gh.lazySingleton<_i963.ProductRepository>(
      () => _i764.ProductRepositoryImpl(gh<_i667.DioClient>()),
    );
    gh.factory<_i243.SplashScreenCubit>(
      () => _i243.SplashScreenCubit(
        gh<_i306.StorageService>(),
        gh<_i852.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i107.AuthRemoteDataSource>(
      () => _i107.AuthRemoteDataSourceImpl(gh<_i667.DioClient>()),
    );
    gh.factory<_i501.ExpenseCubit>(
      () => _i501.ExpenseCubit(
        gh<_i31.ExpenseRepository>(),
        gh<_i986.ExpenseService>(),
      ),
    );
    gh.lazySingleton<_i640.DashboardRemoteDataSource>(
      () => _i640.DashboardRemoteDataSourceImpl(gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i902.ContractRemoteDataSource>(
      () => _i902.ContractRemoteDataSourceImpl(gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i386.DashboardRepository>(
      () =>
          _i1057.DashboardRepositoryImpl(gh<_i640.DashboardRemoteDataSource>()),
    );
    gh.factory<_i782.PaymentCubit>(
      () => _i782.PaymentCubit(gh<_i645.GetPaymentsUseCase>()),
    );
    gh.lazySingleton<_i894.ProfileRepository>(
      () => _i334.ProfileRepositoryImpl(
        gh<_i847.ProfileRemoteDataSource>(),
        gh<_i932.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i1056.DeleteAccountUseCase>(
      () => _i1056.DeleteAccountUseCase(gh<_i894.ProfileRepository>()),
    );
    gh.factory<_i968.WishlistCubit>(
      () => _i968.WishlistCubit(gh<_i203.WishlistService>()),
    );
    gh.factory<_i661.ProductCubit>(
      () => _i661.ProductCubit(
        gh<_i963.ProductRepository>(),
        gh<_i203.WishlistService>(),
        gh<_i1013.CategoryCacheService>(),
      ),
    );
    gh.lazySingleton<_i260.IncomeRepository>(
      () => _i324.IncomeRepositoryImpl(gh<_i610.IncomeRemoteDataSource>()),
    );
    gh.factory<_i410.WarehouseCubit>(
      () => _i410.WarehouseCubit(
        gh<_i624.WarehouseRepository>(),
        gh<_i1013.CategoryCacheService>(),
      ),
    );
    gh.lazySingleton<_i1007.AddToWishlistUseCase>(
      () => _i1007.AddToWishlistUseCase(gh<_i260.IncomeRepository>()),
    );
    gh.lazySingleton<_i1004.GetIncomeDetailUseCase>(
      () => _i1004.GetIncomeDetailUseCase(gh<_i260.IncomeRepository>()),
    );
    gh.lazySingleton<_i263.GetIncomeSourcesUseCase>(
      () => _i263.GetIncomeSourcesUseCase(gh<_i260.IncomeRepository>()),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        remoteDataSource: gh<_i107.AuthRemoteDataSource>(),
        localDataSource: gh<_i852.AuthLocalDataSource>(),
        networkInfo: gh<_i932.NetworkInfo>(),
      ),
    );
    gh.factory<_i279.AddProductCubit>(
      () => _i279.AddProductCubit(gh<_i624.WarehouseRepository>()),
    );
    gh.factory<_i1006.IncomeCubit>(
      () => _i1006.IncomeCubit(
        gh<_i263.GetIncomeSourcesUseCase>(),
        gh<_i1004.GetIncomeDetailUseCase>(),
        gh<_i1007.AddToWishlistUseCase>(),
      ),
    );
    gh.factory<_i814.GetDashboardUseCase>(
      () => _i814.GetDashboardUseCase(gh<_i386.DashboardRepository>()),
    );
    gh.lazySingleton<_i841.ContractRepository>(
      () => _i141.ContractRepositoryImpl(gh<_i902.ContractRemoteDataSource>()),
    );
    gh.factory<_i36.ProfileCubit>(
      () => _i36.ProfileCubit(gh<_i1056.DeleteAccountUseCase>()),
    );
    gh.factory<_i188.LoginUseCase>(
      () => _i188.LoginUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i48.LogoutUseCase>(
      () => _i48.LogoutUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i941.RegisterUseCase>(
      () => _i941.RegisterUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i789.SendCodeUseCase>(
      () => _i789.SendCodeUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i1008.SendLoginCodeUseCase>(
      () => _i1008.SendLoginCodeUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i778.VerifyUseCase>(
      () => _i778.VerifyUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i432.AcceptContract>(
      () => _i432.AcceptContract(gh<_i841.ContractRepository>()),
    );
    gh.lazySingleton<_i609.GetContracts>(
      () => _i609.GetContracts(gh<_i841.ContractRepository>()),
    );
    gh.lazySingleton<_i594.RejectContract>(
      () => _i594.RejectContract(gh<_i841.ContractRepository>()),
    );
    gh.factory<_i989.DashboardCubit>(
      () => _i989.DashboardCubit(gh<_i814.GetDashboardUseCase>()),
    );
    gh.factory<_i521.AuthCubit>(
      () => _i521.AuthCubit(
        loginUseCase: gh<_i188.LoginUseCase>(),
        registerUseCase: gh<_i941.RegisterUseCase>(),
        verifyUseCase: gh<_i778.VerifyUseCase>(),
        sendCodeUseCase: gh<_i789.SendCodeUseCase>(),
        sendLoginCodeUseCase: gh<_i1008.SendLoginCodeUseCase>(),
        logoutUseCase: gh<_i48.LogoutUseCase>(),
      ),
    );
    gh.factory<_i1055.ContractCubit>(
      () => _i1055.ContractCubit(
        gh<_i609.GetContracts>(),
        gh<_i432.AcceptContract>(),
        gh<_i594.RejectContract>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}

class _$NetworkModule extends _i200.NetworkModule {}
