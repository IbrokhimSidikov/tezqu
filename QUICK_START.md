# 🚀 Quick Start Guide - API Implementation

## ✅ What Was Implemented

A complete **Clean Architecture** API structure for your Flutter app with:

- ✅ **Core Infrastructure**: Dio client, error handling, network info
- ✅ **Authentication Feature**: Complete auth flow (register, login, verify, send-code)
- ✅ **State Management**: BLoC/Cubit pattern
- ✅ **Dependency Injection**: GetIt + Injectable
- ✅ **Local Caching**: SharedPreferences for user data & token
- ✅ **Token Management**: Automatic token handling in all API requests

## 📋 Next Steps

### 1. Run Build Runner (REQUIRED)

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

This generates:
- `user_model.freezed.dart` and `user_model.g.dart`
- `di.config.dart` (dependency injection)

### 2. Update Your Login Page

Replace your current login page with the example or integrate the cubit:

```dart
// Add this to your login page
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/auth_cubit.dart';

// Wrap with BlocProvider
BlocProvider(
  create: (context) => getIt<AuthCubit>(),
  child: YourLoginWidget(),
)

// Use in your widget
context.read<AuthCubit>().login(
  phone: '+998$phoneNumber',
  code: codeController.text,
);
```

### 3. Handle Auth States

```dart
BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    if (state is AuthSuccess) {
      // Navigate to home
      context.go(AppRoutes.home);
    } else if (state is AuthError) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    }
  },
  builder: (context, state) {
    if (state is AuthLoading) {
      return CircularProgressIndicator();
    }
    return YourForm();
  },
)
```

## 🔑 Key Files to Know

| File | Purpose |
|------|---------|
| `lib/core/network/dio_client.dart` | All HTTP requests go through here |
| `lib/features/auth/presentation/cubits/auth_cubit.dart` | Use this in your UI |
| `lib/features/auth/domain/usecases/` | Business logic for each operation |
| `.env` | API base URL configuration |

## 💡 Common Use Cases

### Login Flow
```dart
// 1. Send code
await context.read<AuthCubit>().sendCode(phone: '+998901234567');

// 2. User enters code

// 3. Login
await context.read<AuthCubit>().login(
  phone: '+998901234567',
  code: '123456',
);
```

### Register Flow
```dart
// 1. Register
await context.read<AuthCubit>().register(
  phone: '+998901234567',
  name: 'John Doe',
);

// 2. Verify
await context.read<AuthCubit>().verify(
  phone: '+998901234567',
  code: '123456',
);
```

### Logout
```dart
await context.read<AuthCubit>().logout();
```

## 🐛 If Build Runner Fails

If you get errors during build_runner:

1. Clean previous builds:
```bash
flutter pub run build_runner clean
```

2. Run again:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

3. If still issues, try:
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

## 📦 Added Dependencies

These packages were added to `pubspec.yaml`:
- `dio` - HTTP client
- `pretty_dio_logger` - Request logging
- `shared_preferences` - Local storage
- `equatable` - Value equality
- `dartz` - Functional programming
- `connectivity_plus` - Network checking
- `flutter_dotenv` - Environment variables

## 🎯 Example Implementation

Check out: `lib/features/auth/presentation/pages/login_page_example.dart`

This shows a complete working example with:
- Form validation
- Loading states
- Error handling
- Success navigation
- Send code functionality

## 📚 Full Documentation

See `API_STRUCTURE_README.md` for complete documentation including:
- Architecture overview
- Testing guide
- Adding new features
- Troubleshooting
- Best practices

## ⚡ Tips

1. **Token is automatic**: Once user logs in, token is saved and auto-attached to all requests
2. **Offline support**: User data is cached locally
3. **Error handling**: All errors are caught and converted to user-friendly messages
4. **Network check**: App checks internet before making requests
5. **Logging**: In debug mode, all API requests/responses are logged

## 🎨 Customizing for Your Needs

### Change API Response Format

If your API returns data differently, update:
```dart
// lib/features/auth/data/datasources/auth_remote_data_source.dart

// Current format handles both:
final userData = response.data['data'] ?? response.data;
```

### Add More Endpoints

Follow the same pattern:
1. Add method in `auth_remote_data_source.dart`
2. Add method in `auth_repository.dart` and implementation
3. Create use case in `domain/usecases/`
4. Add method in `auth_cubit.dart`
5. Use in UI

### Change Token Storage

Currently uses SharedPreferences. To use Flutter Secure Storage:
1. Replace SharedPreferences with FlutterSecureStorage
2. Update `auth_local_data_source.dart`

## 🎓 Learning Resources

- Clean Architecture: https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html
- BLoC Pattern: https://bloclibrary.dev/
- Dio: https://pub.dev/packages/dio
- Injectable: https://pub.dev/packages/injectable

---

**Ready to use!** After running build_runner, your API structure is complete and production-ready. 🎉
