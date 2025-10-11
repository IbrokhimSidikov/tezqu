# 🎯 Architecture Diagram - TezQu API Structure

## 📊 Complete Flow Diagram

```
┌──────────────────────────────────────────────────────────────────────┐
│                         PRESENTATION LAYER                            │
│  ┌────────────────┐    ┌──────────────┐    ┌──────────────────────┐ │
│  │   LoginPage    │───▶│  AuthCubit   │───▶│    AuthState         │ │
│  │   (UI/Widget)  │◀───│ (State Mgmt) │◀───│ (Loading/Success)    │ │
│  └────────────────┘    └──────┬───────┘    └──────────────────────┘ │
│                               │                                       │
└───────────────────────────────┼───────────────────────────────────────┘
                                │ calls
                                ▼
┌──────────────────────────────────────────────────────────────────────┐
│                           DOMAIN LAYER                                │
│  ┌──────────────────┐   ┌──────────────────┐   ┌─────────────────┐ │
│  │  LoginUseCase    │   │  RegisterUseCase │   │  VerifyUseCase  │ │
│  │  (Business Logic)│   │  (Business Logic)│   │ (Business Logic)│ │
│  └────────┬─────────┘   └────────┬─────────┘   └────────┬────────┘ │
│           │                      │                       │          │
│           └──────────────────────┼───────────────────────┘          │
│                                  │ uses                              │
│                    ┌─────────────▼──────────────┐                   │
│                    │   AuthRepository           │                   │
│                    │   (Interface/Contract)     │                   │
│                    └─────────────┬──────────────┘                   │
└──────────────────────────────────┼───────────────────────────────────┘
                                   │ implemented by
                                   ▼
┌──────────────────────────────────────────────────────────────────────┐
│                            DATA LAYER                                 │
│                    ┌───────────────────────────┐                     │
│                    │  AuthRepositoryImpl       │                     │
│                    │  (Concrete Implementation)│                     │
│                    └─────────┬─────────────────┘                     │
│                              │                                        │
│           ┌──────────────────┼──────────────────┐                    │
│           │                  │                  │                    │
│           ▼                  ▼                  ▼                    │
│  ┌────────────────┐  ┌──────────────┐  ┌──────────────────┐        │
│  │ Remote Source  │  │ Local Source │  │  NetworkInfo     │        │
│  │ (API Calls)    │  │ (Cache/Store)│  │ (Connectivity)   │        │
│  └───────┬────────┘  └──────┬───────┘  └──────────────────┘        │
│          │                  │                                        │
└──────────┼──────────────────┼────────────────────────────────────────┘
           │                  │
           ▼                  ▼
    ┌──────────┐      ┌─────────────────┐
    │ DioClient│      │ SharedPreferences│
    │ (HTTP)   │      │ (Local Storage)  │
    └────┬─────┘      └──────────────────┘
         │
         ▼
   https://api.tezqu.uz
```

## 🔄 Request Flow Example - Login Process

```
1. USER ACTION
   │
   └─▶ User taps "Dasturga kirish" button
       │
       ▼
2. PRESENTATION LAYER
   │
   ├─▶ login_page.dart calls:
   │   context.read<AuthCubit>().login(phone, code)
   │
   └─▶ AuthCubit emits: AuthLoading()
       │
       ▼
3. DOMAIN LAYER
   │
   ├─▶ AuthCubit calls: LoginUseCase(phone, code)
   │
   ├─▶ LoginUseCase calls: repository.login(phone, code)
   │
   └─▶ AuthRepository interface defines contract
       │
       ▼
4. DATA LAYER
   │
   ├─▶ AuthRepositoryImpl checks network
   │   │
   │   ├─▶ NetworkInfo checks connectivity ✓
   │   │
   │   └─▶ AuthRemoteDataSource.login(phone, code)
   │       │
   │       └─▶ DioClient.post('/auth/login', data: {...})
   │           │
   │           └─▶ HTTP POST Request
   │               │
   │               ▼
5. BACKEND
   │
   └─▶ https://api.tezqu.uz/auth/login
       │
       └─▶ Returns: { "data": { "id": "123", "token": "..." } }
           │
           ▼
6. RESPONSE FLOW (Back Up)
   │
   ├─▶ DioClient receives response
   │   │
   │   └─▶ Saves token to SharedPreferences
   │
   ├─▶ AuthRemoteDataSource converts JSON to UserModel
   │
   ├─▶ AuthRepositoryImpl caches user locally
   │
   ├─▶ Repository converts UserModel to UserEntity
   │
   ├─▶ Repository returns: Right(UserEntity)
   │
   ├─▶ LoginUseCase returns result to Cubit
   │
   ├─▶ AuthCubit emits: AuthSuccess(user)
   │
   └─▶ UI updates automatically via BlocBuilder/Consumer
       │
       └─▶ Navigate to home screen
```

## 🗂️ Directory Structure with Dependencies

```
lib/
│
├── core/
│   ├── di/                     [Injectable, GetIt]
│   │   ├── di.dart            → Registers all dependencies
│   │   ├── di.config.dart     → Auto-generated
│   │   └── register_module.dart
│   │
│   ├── error/
│   │   ├── exceptions.dart    → Data layer errors
│   │   └── failures.dart      → Domain layer errors [Equatable]
│   │
│   └── network/               [Dio, Connectivity]
│       ├── dio_client.dart    → HTTP client + token management
│       ├── network_info.dart  → Check internet connection
│       └── network_module.dart
│
└── features/
    └── auth/
        │
        ├── data/              [Converts external ➜ internal]
        │   ├── datasources/
        │   │   ├── auth_remote_data_source.dart  [Dio]
        │   │   └── auth_local_data_source.dart   [SharedPreferences]
        │   │
        │   ├── models/
        │   │   ├── user_model.dart               [Freezed, JsonSerializable]
        │   │   ├── user_model.freezed.dart       → Auto-generated
        │   │   └── user_model.g.dart             → Auto-generated
        │   │
        │   └── repositories/
        │       └── auth_repository_impl.dart     [Implements domain contract]
        │
        ├── domain/            [Pure Dart - No Flutter/External deps]
        │   ├── entities/
        │   │   └── user_entity.dart              [Equatable]
        │   │
        │   ├── repositories/
        │   │   └── auth_repository.dart          [Abstract interface]
        │   │
        │   └── usecases/
        │       ├── login_usecase.dart            [Injectable]
        │       ├── register_usecase.dart         [Injectable]
        │       ├── verify_usecase.dart           [Injectable]
        │       ├── send_code_usecase.dart        [Injectable]
        │       └── logout_usecase.dart           [Injectable]
        │
        └── presentation/      [Flutter UI]
            ├── cubits/
            │   ├── auth_cubit.dart               [Bloc, Injectable]
            │   └── auth_state.dart               [Equatable]
            │
            └── pages/
                ├── login_page.dart
                └── login_page_example.dart
```

## 🎯 Data Transformation Flow

```
API Response (JSON)
      ↓
┌─────────────────────────────────────┐
│ { "data": {                         │
│     "id": "123",                    │
│     "phone": "+998901234567",       │
│     "name": "John",                 │
│     "token": "eyJ..."               │
│   }                                 │
│ }                                   │
└─────────────────────────────────────┘
      ↓ fromJson()
┌─────────────────────────────────────┐
│ UserModel (Freezed)                 │
│ - Immutable                         │
│ - JSON serializable                 │
│ - Data Layer only                   │
└─────────────────────────────────────┘
      ↓ toEntity()
┌─────────────────────────────────────┐
│ UserEntity (Equatable)              │
│ - Pure Dart object                  │
│ - No JSON dependencies              │
│ - Used in Domain & Presentation     │
└─────────────────────────────────────┘
      ↓
┌─────────────────────────────────────┐
│ AuthSuccess State                   │
│ - Contains UserEntity               │
│ - Triggers UI updates               │
└─────────────────────────────────────┘
      ↓
┌─────────────────────────────────────┐
│ UI displays user info               │
│ - Navigate to home                  │
│ - Show welcome message              │
└─────────────────────────────────────┘
```

## 🔐 Token Management Flow

```
┌─────────────────────────────────────────────────────────┐
│                    TOKEN LIFECYCLE                       │
└─────────────────────────────────────────────────────────┘

1. LOGIN/VERIFY SUCCESS
   ├─▶ API returns token in response
   ├─▶ AuthRemoteDataSource extracts token
   ├─▶ DioClient.saveToken(token)
   └─▶ SharedPreferences stores token

2. SUBSEQUENT API REQUESTS
   ├─▶ DioClient interceptor triggers
   ├─▶ Reads token from SharedPreferences
   ├─▶ Adds header: "Authorization: Bearer {token}"
   └─▶ Request sent with auth

3. TOKEN EXPIRY (401 Response)
   ├─▶ DioClient error interceptor catches 401
   ├─▶ Clears token from SharedPreferences
   └─▶ User redirected to login (implement as needed)

4. LOGOUT
   ├─▶ User calls logout
   ├─▶ DioClient.clearToken()
   ├─▶ AuthLocalDataSource.clearCache()
   └─▶ User data and token removed
```

## 🔄 Dependency Injection Map

```
                    GetIt (Service Locator)
                            │
        ┌───────────────────┼───────────────────┐
        │                   │                   │
        ▼                   ▼                   ▼
   SharedPreferences    Connectivity       DioClient
        │                   │                   │
        └───────┬───────────┴─────────┐         │
                ▼                     ▼         │
          NetworkInfo          LocalDataSource  │
                │                     │         │
                └──────┬──────────────┴─────────┘
                       ▼
              AuthRepositoryImpl
                       │
           ┌───────────┼───────────┐
           ▼           ▼           ▼
      LoginUseCase  RegisterUC  VerifyUC
           │           │           │
           └───────────┼───────────┘
                       ▼
                   AuthCubit
                       │
                       ▼
                   UI Widgets
```

## 📱 State Flow in UI

```
┌────────────────────────────────────────────────┐
│            AuthState States                    │
├────────────────────────────────────────────────┤
│                                                │
│  AuthInitial ──┐                               │
│                │                               │
│                ├──▶ AuthLoading ──┐            │
│                │                  │            │
│  CodeSent ─────┘                  ├──▶ Success │
│                                   │            │
│                                   └──▶ Error   │
│                                                │
│  AuthUnauthenticated ◀── Logout                │
│                                                │
└────────────────────────────────────────────────┘

UI Reactions:
- AuthInitial       → Show login form
- AuthLoading       → Show loading indicator
- CodeSent          → Show "Kod yuborildi" message
- AuthSuccess       → Navigate to home + show success
- AuthError         → Show error message
- Unauthenticated   → Navigate to login
```

## 🎓 Key Design Patterns Used

```
1. Repository Pattern
   └─▶ Abstracts data sources from business logic

2. Use Case Pattern (Interactor)
   └─▶ Single responsibility per business operation

3. Dependency Injection
   └─▶ Loose coupling, easy testing

4. BLoC Pattern
   └─▶ Reactive state management

5. Either Pattern (Functional)
   └─▶ Type-safe error handling

6. Factory Pattern
   └─▶ Model creation from JSON

7. Singleton Pattern
   └─▶ DioClient, SharedPreferences

8. Observer Pattern
   └─▶ BLoC state updates trigger UI rebuilds
```

## 💡 Understanding the Separation

```
┌─────────────────────────────────────────────────┐
│ WHY THREE LAYERS?                               │
├─────────────────────────────────────────────────┤
│                                                 │
│ PRESENTATION (UI)                               │
│ ├─ Can change UI framework                     │
│ └─ Doesn't affect business logic               │
│                                                 │
│ DOMAIN (Business)                               │
│ ├─ Core logic never changes                    │
│ └─ Independent of UI or data sources           │
│                                                 │
│ DATA (External)                                 │
│ ├─ Can switch from REST to GraphQL             │
│ ├─ Can change from Dio to http                 │
│ └─ Doesn't affect business logic               │
│                                                 │
└─────────────────────────────────────────────────┘
```

---

This architecture ensures your app is **scalable, testable, and maintainable** for the long term! 🚀
