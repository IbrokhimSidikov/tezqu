enum UserRole {
  admin('admin'),
  collector('collector'),
  investor('investor'),
  customer('customer');

  final String value;
  const UserRole(this.value);

  static UserRole fromString(String? role) {
    if (role == null) return UserRole.customer;
    
    switch (role.toLowerCase()) {
      case 'admin':
        return UserRole.admin;
      case 'collector':
        return UserRole.collector;
      case 'investor':
        return UserRole.investor;
      case 'customer':
        return UserRole.customer;
      default:
        return UserRole.customer;
    }
  }
}

enum DashboardCardType {
  payments,
  products,
  income,
  expense,
  warehouse,
  dashboard,
  collectables,
}

class RolePermissions {
  // Define which cards each role can see
  static const Map<UserRole, List<DashboardCardType>> _rolePermissions = {
    UserRole.admin: [
      DashboardCardType.payments,
      DashboardCardType.products,
      DashboardCardType.income,
      DashboardCardType.expense,
      DashboardCardType.warehouse,
      DashboardCardType.dashboard,
    ],
    UserRole.collector: [
      DashboardCardType.payments,
      DashboardCardType.products,
      DashboardCardType.collectables,
    ],
    UserRole.investor: [
      DashboardCardType.income,
      DashboardCardType.expense,
      DashboardCardType.dashboard,
    ],
    UserRole.customer: [
      DashboardCardType.payments,
      DashboardCardType.products,
    ],
  };

  /// Check if a role has permission to see a specific card
  static bool canSeeCard(UserRole role, DashboardCardType cardType) {
    return _rolePermissions[role]?.contains(cardType) ?? false;
  }

  /// Get all allowed cards for a role
  static List<DashboardCardType> getAllowedCards(UserRole role) {
    return _rolePermissions[role] ?? [];
  }

  /// Check if role has access to any admin features
  static bool isAdmin(UserRole role) {
    return role == UserRole.admin;
  }

  /// Check if role can manage products
  static bool canManageProducts(UserRole role) {
    return role == UserRole.admin || role == UserRole.collector;
  }

  /// Check if role can view financial data
  static bool canViewFinancials(UserRole role) {
    return role == UserRole.admin || 
           role == UserRole.investor || 
           role == UserRole.collector;
  }
}
