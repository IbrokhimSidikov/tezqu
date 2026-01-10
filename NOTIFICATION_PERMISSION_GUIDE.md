# Notification Permission Guide

## How It Works

### 1. Custom Pre-Permission Dialog (Uzbek Language)
When you request notification permission, users will first see a **custom dialog in Uzbek** that you can fully customize. This dialog explains why you need notification access.

**Location:** `lib/core/widgets/permission_dialog.dart`

**Current Text:**
- Title: "Bildirishnomalar"
- Description: "Bildirishnomalarni yoqish uchun ruxsat bering"
- Benefits listed:
  - Yangi takliflar haqida xabarlar
  - To'lovlar haqida eslatmalar
  - Muhim yangiliklar
- Buttons: "Keyinroq" (Later) and "Ruxsat berish" (Allow)

### 2. System Permission Dialog (Android OS Language)
After user clicks "Ruxsat berish", Android will show the **system permission dialog** in the device's system language. This cannot be customized - it's controlled by Android OS.

## How to Request Permission

### Option 1: Request on Home Page (Recommended)
Add this to your home page to request permission when user first enters the app:

```dart
// In lib/features/home/presentation/pages/home.dart

class _HomePageContent extends StatefulWidget {
  const _HomePageContent();

  @override
  State<_HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<_HomePageContent> {
  bool _permissionRequested = false;

  @override
  void initState() {
    super.initState();
    _requestNotificationPermission();
  }

  Future<void> _requestNotificationPermission() async {
    if (!_permissionRequested) {
      _permissionRequested = true;
      // Wait a bit for UI to settle
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        FirebaseMessagingService().setContext(context);
        await FirebaseMessagingService().requestPermissionWithDialog();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // ... rest of your build method
  }
}
```

### Option 2: Request After Onboarding
Add to the last onboarding screen or after login:

```dart
// After successful login or onboarding completion
FirebaseMessagingService().setContext(context);
await FirebaseMessagingService().requestPermissionWithDialog();
```

### Option 3: Add a Button in Settings/Profile
Let users manually enable notifications:

```dart
ElevatedButton(
  onPressed: () async {
    FirebaseMessagingService().setContext(context);
    await FirebaseMessagingService().requestPermissionWithDialog();
  },
  child: const Text('Bildirishnomalarni yoqish'),
)
```

## Customizing the Dialog Text

Edit `lib/core/widgets/permission_dialog.dart` to change:

1. **Title**: Change `'Bildirishnomalar'`
2. **Description**: Change `'Bildirishnomalarni yoqish uchun ruxsat bering'`
3. **Benefits**: Modify the three bullet points
4. **Buttons**: Change `'Keyinroq'` and `'Ruxsat berish'`
5. **Colors**: Modify `Color(0xFF5FCCB4)` to match your brand

## Testing

1. Uninstall the app completely
2. Reinstall and launch
3. Navigate to where you added the permission request
4. You should see the custom Uzbek dialog first
5. After clicking "Ruxsat berish", you'll see the Android system dialog
6. Grant permission
7. Send a test notification - it should appear and navigate to notifications page when tapped

## Important Notes

- The **custom dialog** can be fully customized in any language
- The **system dialog** is controlled by Android and shows in device language
- Permission is only requested once - if denied, user must enable in system settings
- On Android 12 and below, notifications work without explicit permission
- On Android 13+, the POST_NOTIFICATIONS permission is required (already added to AndroidManifest.xml)
