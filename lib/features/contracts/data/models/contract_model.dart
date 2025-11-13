import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/contract_entity.dart';

part 'contract_model.freezed.dart';

@Freezed(toJson: false, fromJson: false)
class ContractsModel with _$ContractsModel {
  const factory ContractsModel({
    @Default([]) List<ContractGroupModel> contractGroups,
  }) = _ContractsModel;

  const ContractsModel._();

  factory ContractsModel.fromJson(Map<String, dynamic> json) {
    // Handle the API response structure
    if (json['data'] != null && json['data'] is List) {
      final List<dynamic> data = json['data'];
      
      // Group contracts by date
      final Map<String, List<ContractItemModel>> groupedContracts = {};
      
      for (var item in data) {
        final contract = ContractItemModel.fromJson(item);
        final date = item['created_at'] ?? 'Unknown Date';
        
        if (!groupedContracts.containsKey(date)) {
          groupedContracts[date] = [];
        }
        groupedContracts[date]!.add(contract);
      }
      
      // Convert to ContractGroupModel list
      final groups = groupedContracts.entries
          .map((entry) => ContractGroupModel(
                date: entry.key,
                contracts: entry.value,
              ))
          .toList();
      
      return ContractsModel(contractGroups: groups);
    }
    
    return const ContractsModel();
  }

  ContractsEntity toEntity() {
    return ContractsEntity(
      contractGroups: contractGroups.map((group) => group.toEntity()).toList(),
    );
  }

  @override
  // TODO: implement contractGroups
  List<ContractGroupModel> get contractGroups => throw UnimplementedError();
}

@Freezed(toJson: false, fromJson: false)
class ContractGroupModel with _$ContractGroupModel {
  const factory ContractGroupModel({
    required String date,
    @Default([]) List<ContractItemModel> contracts,
  }) = _ContractGroupModel;

  const ContractGroupModel._();

  ContractGroupEntity toEntity() {
    return ContractGroupEntity(
      date: date,
      contracts: contracts.map((contract) => contract.toEntity()).toList(),
    );
  }

  @override
  // TODO: implement contracts
  List<ContractItemModel> get contracts => throw UnimplementedError();

  @override
  // TODO: implement date
  String get date => throw UnimplementedError();
}

@Freezed(toJson: false, fromJson: false)
class ContractItemModel with _$ContractItemModel {
  const factory ContractItemModel({
    required String id,
    required String vehicleName,
    required String clientName,
    required String clientId,
    String? status,
    String? vehicleImage,
    String? contractType,
    String? totalServiceFee,
    String? serviceContractPdf,
    String? productName,
    String? collectorFirstName,
    String? collectorLastName,
    String? totalPrice,
    String? initialPayment,
    String? installmentAmount,
    int? installmentPeriodMonths,
    String? interestRate,
    String? totalInterest,
    String? monthlyPayment,
    String? productPrice,
    String? userFirstName,
    String? userLastName,
    String? approvedByAdminFirstName,
    String? approvedByAdminLastName,
    List<String>? productImageUrls,
  }) = _ContractItemModel;

  const ContractItemModel._();

  factory ContractItemModel.fromJson(Map<String, dynamic> json) {
    // Handle id as either int or String
    String parseId(dynamic value) {
      if (value is String) return value;
      if (value is int) return value.toString();
      return '';
    }

    // Extract product name, price, and image URLs from nested product object
    String? productName;
    String? productPrice;
    List<String>? productImageUrls;
    if (json['product'] != null && json['product'] is Map) {
      productName = json['product']['name'] as String?;
      productPrice = json['product']['price'] as String?;
      
      // Extract image_urls array
      if (json['product']['image_urls'] != null && json['product']['image_urls'] is List) {
        productImageUrls = (json['product']['image_urls'] as List)
            .map((url) => url.toString())
            .toList();
      }
    }

    // Extract collector name from nested collector object
    String? collectorFirstName;
    String? collectorLastName;
    if (json['collector'] != null && json['collector'] is Map) {
      collectorFirstName = json['collector']['first_name'] as String?;
      collectorLastName = json['collector']['last_name'] as String?;
    }

    // Extract user name from nested user object
    String? userFirstName;
    String? userLastName;
    if (json['user'] != null && json['user'] is Map) {
      userFirstName = json['user']['first_name'] as String?;
      userLastName = json['user']['last_name'] as String?;
    }

    // Extract admin name from nested approved_by_admin_user object
    String? approvedByAdminFirstName;
    String? approvedByAdminLastName;
    if (json['approved_by_admin_user'] != null && json['approved_by_admin_user'] is Map) {
      approvedByAdminFirstName = json['approved_by_admin_user']['first_name'] as String?;
      approvedByAdminLastName = json['approved_by_admin_user']['last_name'] as String?;
    }

    return ContractItemModel(
      id: parseId(json['id']),
      vehicleName: json['vehicle_name'] as String? ?? json['vehicleName'] as String? ?? productName ?? '',
      clientName: json['client_name'] as String? ?? json['clientName'] as String? ?? '',
      clientId: json['client_id'] as String? ?? json['clientId'] as String? ?? '',
      status: json['status'] as String?,
      vehicleImage: json['vehicle_image'] as String? ?? json['vehicleImage'] as String?,
      contractType: json['contract_type'] as String?,
      totalServiceFee: json['total_service_fee'] as String?,
      serviceContractPdf: json['service_contract_pdf'] as String?,
      productName: productName,
      collectorFirstName: collectorFirstName,
      collectorLastName: collectorLastName,
      totalPrice: json['total_price'] as String?,
      initialPayment: json['initial_payment'] as String?,
      installmentAmount: json['installment_amount'] as String?,
      installmentPeriodMonths: json['installment_period_months'] as int?,
      interestRate: json['interest_rate'] as String?,
      totalInterest: json['total_interest'] as String?,
      monthlyPayment: json['monthly_payment'] as String?,
      productPrice: productPrice,
      userFirstName: userFirstName,
      userLastName: userLastName,
      approvedByAdminFirstName: approvedByAdminFirstName,
      approvedByAdminLastName: approvedByAdminLastName,
      productImageUrls: productImageUrls,
    );
  }

  ContractItemEntity toEntity() {
    return ContractItemEntity(
      id: id,
      vehicleName: vehicleName,
      clientName: clientName,
      clientId: clientId,
      status: status,
      vehicleImage: vehicleImage,
      contractType: contractType,
      totalServiceFee: totalServiceFee,
      serviceContractPdf: serviceContractPdf,
      productName: productName,
      collectorFirstName: collectorFirstName,
      collectorLastName: collectorLastName,
      totalPrice: totalPrice,
      initialPayment: initialPayment,
      installmentAmount: installmentAmount,
      installmentPeriodMonths: installmentPeriodMonths,
      interestRate: interestRate,
      totalInterest: totalInterest,
      monthlyPayment: monthlyPayment,
      productPrice: productPrice,
      userFirstName: userFirstName,
      userLastName: userLastName,
      approvedByAdminFirstName: approvedByAdminFirstName,
      approvedByAdminLastName: approvedByAdminLastName,
      productImageUrls: productImageUrls,
    );
  }

  @override
  // TODO: implement clientId
  String get clientId => throw UnimplementedError();

  @override
  // TODO: implement clientName
  String get clientName => throw UnimplementedError();

  @override
  // TODO: implement id
  String get id => throw UnimplementedError();

  @override
  // TODO: implement status
  String? get status => throw UnimplementedError();

  @override
  // TODO: implement vehicleImage
  String? get vehicleImage => throw UnimplementedError();

  @override
  // TODO: implement vehicleName
  String get vehicleName => throw UnimplementedError();

  @override
  // TODO: implement contractType
  String? get contractType => throw UnimplementedError();

  @override
  // TODO: implement totalServiceFee
  String? get totalServiceFee => throw UnimplementedError();

  @override
  // TODO: implement serviceContractPdf
  String? get serviceContractPdf => throw UnimplementedError();

  @override
  // TODO: implement productName
  String? get productName => throw UnimplementedError();

  @override
  // TODO: implement collectorFirstName
  String? get collectorFirstName => throw UnimplementedError();

  @override
  // TODO: implement collectorLastName
  String? get collectorLastName => throw UnimplementedError();

  @override
  // TODO: implement approvedByAdminFirstName
  String? get approvedByAdminFirstName => throw UnimplementedError();

  @override
  // TODO: implement approvedByAdminLastName
  String? get approvedByAdminLastName => throw UnimplementedError();

  @override
  // TODO: implement initialPayment
  String? get initialPayment => throw UnimplementedError();

  @override
  // TODO: implement installmentAmount
  String? get installmentAmount => throw UnimplementedError();

  @override
  // TODO: implement installmentPeriodMonths
  int? get installmentPeriodMonths => throw UnimplementedError();

  @override
  // TODO: implement interestRate
  String? get interestRate => throw UnimplementedError();

  @override
  // TODO: implement monthlyPayment
  String? get monthlyPayment => throw UnimplementedError();

  @override
  // TODO: implement productPrice
  String? get productPrice => throw UnimplementedError();

  @override
  // TODO: implement totalInterest
  String? get totalInterest => throw UnimplementedError();

  @override
  // TODO: implement totalPrice
  String? get totalPrice => throw UnimplementedError();

  @override
  // TODO: implement userFirstName
  String? get userFirstName => throw UnimplementedError();

  @override
  // TODO: implement userLastName
  String? get userLastName => throw UnimplementedError();

  @override
  // TODO: implement productImageUrls
  List<String>? get productImageUrls => throw UnimplementedError();
}
