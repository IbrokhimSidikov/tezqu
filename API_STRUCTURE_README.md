# API Structure Documentation - TezQu

## 📁 Project Structure

```
lib/
├── core/
│   ├── di/                          # Dependency Injection
│   │   ├── di.dart
│   │   ├── di.config.dart          # Auto-generated
│   │   └── register_module.dart
│   ├── error/                       # Error Handling
│   │   ├── exceptions.dart         # Custom exceptions
│   │   └── failures.dart           # Failure types
│   └── network/                     # Network Layer
│       ├── dio_client.dart         # Dio HTTP client
│       ├── network_info.dart       # Network connectivity checker
│       └── network_module.dart
│
└── features/
    └── auth/
        ├── data/
        │   ├── datasources/
        │   │   ├── auth_remote_data_source.dart    # API calls
        │   │   └── auth_local_data_source.dart     # Local storage
        │   ├── models/
        │   │   ├── user_model.dart
        │   │   ├── user_model.freezed.dart        # Auto-generated
        │   │   └── user_model.g.dart              # Auto-generated
        │   └── repositories/
        │       └── auth_repository_impl.dart
        ├── domain/
        │   ├── entities/
        │   │   └── user_entity.dart
        │   ├── repositories/
        │   │   └── auth_repository.dart
        │   └── usecases/
        │       ├── login_usecase.dart
        │       ├── register_usecase.dart
        │       ├── verify_usecase.dart
        │       ├── send_code_usecase.dart
        │       └── logout_usecase.dart
        └── presentation/
            ├── cubits/
            │   ├── auth_cubit.dart
            │   └── auth_state.dart
            └── pages/
                ├── login_page.dart
                └── login_page_example.dart         # Example implementation
```

## 🏗️ Clean Architecture Layers

### 1. **Presentation Layer** (UI)
- **Cubits/Blocs**: Manage state and handle user actions
- **Pages/Widgets**: UI components
- **Depends on**: Domain layer only

### 2. **Domain Layer** (Business Logic)
- **Entities**: Core business models
- **Repositories**: Abstract interfaces
- **Use Cases**: Business logic operations
- **Independent**: No dependencies on other layers

### 3. **Data Layer** (Data Management)
- **Models**: Data Transfer Objects (DTOs)
- **Data Sources**: Remote (API) and Local (Cache)
- **Repository Implementations**: Concrete implementations
- **Depends on**: Domain layer

## 🔌 API Endpoints

Base URL: `https://api.tezqu.uz`

| Endpoint | Method | Description | Request Body |
|----------|--------|-------------|--------------|
| `/auth/register` | POST | Register new user | `{ phone, name, email? }` |
| `/auth/verify` | POST | Verify phone with OTP | `{ phone, code }` |
| `/auth/login` | POST | Login user | `{ phone, code }` |
| `/auth/send-code` | POST | Send verification code | `{ phone }` |

## 🚀 Getting Started

### 1. Install Dependencies

```bash
flutter pub get
```

### 2. Generate Code

Run build_runner to generate Freezed, JSON serialization, and Injectable code:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. Environment Variables

Create a `.env` file in the root directory:

```env
BASE_URL=https://api.tezqu.uz
```

## 💻 Usage Examples

### 1. Using Auth Cubit in Your UI

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezqu/core/di/di.dart';
import 'package:tezqu/features/auth/presentation/cubits/auth_cubit.dart';

class MyLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            // Navigate to home
            context.go('/home');
          } else if (state is AuthError) {
            // Show error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return CircularProgressIndicator();
          }
          
          return YourLoginForm(
            onLogin: (phone, code) {
              context.read<AuthCubit>().login(
                phone: phone,
                code: code,
              );
            },
          );
        },
      ),
    );
  }
}
```

### 2. Login Flow

```dart
// 1. Send verification code
context.read<AuthCubit>().sendCode(phone: '+998901234567');

// 2. Login with code
context.read<AuthCubit>().login(
  phone: '+998901234567',
  code: '123456',
);
```

### 3. Register Flow

```dart
// 1. Register user
context.read<AuthCubit>().register(
  phone: '+998901234567',
  name: 'John Doe',
  email: 'john@example.com', // optional
);

// 2. Verify phone
context.read<AuthCubit>().verify(
  phone: '+998901234567',
  code: '123456',
);
```

### 4. Logout

```dart
context.read<AuthCubit>().logout();
```

## 🔐 Token Management

Tokens are automatically managed by the `DioClient`:

- **Saved**: When login/verify returns a token
- **Attached**: Automatically added to all requests as `Authorization: Bearer <token>`
- **Cleared**: On logout or 401 errors

## 🎯 State Management

The `AuthCubit` has the following states:

- `AuthInitial`: Initial state
- `AuthLoading`: Operation in progress
- `AuthSuccess`: Operation successful (login/register/verify)
- `CodeSent`: Verification code sent
- `AuthError`: Error occurred
- `AuthUnauthenticated`: User logged out

## 🛠️ Error Handling

Errors are handled at multiple levels:

1. **Exceptions** (Data Layer):
   - `ServerException`: API errors
   - `NetworkException`: Network issues
   - `CacheException`: Local storage errors
   - `UnauthorizedException`: Auth errors

2. **Failures** (Domain Layer):
   - `ServerFailure`
   - `NetworkFailure`
   - `CacheFailure`
   - `UnknownFailure`

3. **States** (Presentation Layer):
   - `AuthError`: User-friendly error messages

## 📦 Key Packages

- **dio**: HTTP client
- **pretty_dio_logger**: Request/response logging (debug only)
- **shared_preferences**: Local storage
- **connectivity_plus**: Network connectivity check
- **get_it + injectable**: Dependency injection
- **flutter_bloc**: State management
- **freezed**: Immutable models
- **dartz**: Functional programming (Either type)
- **equatable**: Value equality
- **flutter_dotenv**: Environment variables

## 🔄 API Response Format

The implementation expects responses in one of these formats:

```json
// Format 1: Data wrapped in 'data' field
{
  "data": {
    "id": "123",
    "phone": "+998901234567",
    "name": "John Doe",
    "token": "eyJ..."
  }
}

// Format 2: Direct data
{
  "id": "123",
  "phone": "+998901234567",
  "name": "John Doe",
  "token": "eyJ..."
}
```

Error responses:
```json
{
  "message": "Error description",
  "error": "Error details"
}
```

## 🧪 Testing

### Unit Tests
```dart
// Test use cases
test('should login user successfully', () async {
  // Arrange
  when(mockRepository.login(phone: any, code: any))
    .thenAnswer((_) async => Right(tUser));
  
  // Act
  final result = await loginUseCase(phone: tPhone, code: tCode);
  
  // Assert
  expect(result, Right(tUser));
});
```

### Widget Tests
```dart
testWidgets('should show loading when AuthLoading', (tester) async {
  // Arrange & Act
  await tester.pumpWidget(MyLoginPage());
  
  // Assert
  expect(find.byType(CircularProgressIndicator), findsOneWidget);
});
```

## 📝 Adding New Features

To add a new feature (e.g., Products):

1. Create feature folder: `lib/features/products/`
2. Add domain layer: entities, repository interface, use cases
3. Add data layer: models, data sources, repository implementation
4. Add presentation layer: cubits/blocs, pages
5. Register dependencies with `@injectable` annotation
6. Run `flutter pub run build_runner build --delete-conflicting-outputs`

## 🐛 Debugging

- **Enable Dio Logger**: Already enabled in debug mode
- **Check Network**: Use `NetworkInfo` to check connectivity
- **Inspect State**: Use `BlocObserver` for global state monitoring
- **Token Issues**: Check SharedPreferences for stored token

## 📚 Best Practices

1. ✅ Always use use cases, never call repositories directly from UI
2. ✅ Keep business logic in domain layer
3. ✅ Use proper error handling with Either type
4. ✅ Cache user data locally for offline access
5. ✅ Use freezed for immutable models
6. ✅ Follow single responsibility principle
7. ✅ Write tests for critical business logic
8. ✅ Use dependency injection for loose coupling

## 🔍 Troubleshooting

### Build Runner Issues
```bash
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

### Dependency Injection Issues
- Make sure all classes have `@injectable` or `@lazySingleton` annotations
- Run build_runner after adding new dependencies
- Check `di.config.dart` is generated

### API Issues
- Verify `.env` file exists and BASE_URL is correct
- Check network connectivity
- Use Dio logger to inspect requests/responses
- Verify API endpoint format matches your backend

## 📞 Support

For issues or questions, refer to:
- Flutter documentation: https://flutter.dev/docs
- Clean Architecture: https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html
- Bloc pattern: https://bloclibrary.dev/
