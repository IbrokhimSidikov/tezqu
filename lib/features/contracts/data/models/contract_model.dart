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
    required int id,
    required String vehicleName,
    required String clientName,
    required String clientId,
    String? status,
    String? vehicleImage,
  }) = _ContractItemModel;

  const ContractItemModel._();

  factory ContractItemModel.fromJson(Map<String, dynamic> json) {
    // Handle id as either int or String
    int parseId(dynamic value) {
      if (value is int) return value;
      if (value is String) return int.tryParse(value) ?? 0;
      return 0;
    }

    return ContractItemModel(
      id: parseId(json['id']),
      vehicleName: json['vehicle_name'] as String? ?? json['vehicleName'] as String? ?? '',
      clientName: json['client_name'] as String? ?? json['clientName'] as String? ?? '',
      clientId: json['client_id'] as String? ?? json['clientId'] as String? ?? '',
      status: json['status'] as String?,
      vehicleImage: json['vehicle_image'] as String? ?? json['vehicleImage'] as String?,
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
  int get id => throw UnimplementedError();

  @override
  // TODO: implement status
  String? get status => throw UnimplementedError();

  @override
  // TODO: implement vehicleImage
  String? get vehicleImage => throw UnimplementedError();

  @override
  // TODO: implement vehicleName
  String get vehicleName => throw UnimplementedError();
}
