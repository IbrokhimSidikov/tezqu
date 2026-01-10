# Firebase Cloud Messaging Setup Instructions

## ✅ Completed Steps

### 1. Dependencies Added
- `firebase_core: ^3.8.1`
- `firebase_messaging: ^15.1.5`
- `flutter_local_notifications: ^18.0.1`

### 2. Android Configuration ✅
- ✅ Google Services plugin added to build.gradle files
- ✅ google-services.json file already in place at `android/app/google-services.json`
- ✅ AndroidManifest.xml already configured with FCM permissions and services
- ✅ Notification channel configured

### 3. Flutter Code Implementation ✅
- ✅ Created `FirebaseMessagingService` at `lib/core/services/firebase_messaging_service.dart`
- ✅ Updated `main.dart` with Firebase initialization
- ✅ Background message handler implemented
- ✅ Foreground notification handling configured

### 4. iOS Configuration ✅
- ✅ AppDelegate.swift updated with Firebase imports and configuration
- ✅ Info.plist updated with background modes and Firebase settings

## 🔴 Required: iOS GoogleService-Info.plist

You need to download the `GoogleService-Info.plist` file for iOS from Firebase Console:

### Steps to Download:
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project: **tez-qu**
3. Click on the iOS app (or add iOS app if not exists)
4. Use Bundle ID: `com.tezqu.v1` (same as Android package name)
5. Download the `GoogleService-Info.plist` file
6. Place it in: `ios/Runner/GoogleService-Info.plist`

### After downloading the file:
1. Open Xcode: `open ios/Runner.xcworkspace`
2. Drag and drop `GoogleService-Info.plist` into the Runner folder in Xcode
3. Make sure "Copy items if needed" is checked
4. Make sure "Runner" target is selected

## 📱 Testing FCM

### Get FCM Token:
The token will be printed in the console when you run the app. Look for:
```
FCM Token: <your-token-here>
```

### Test Notifications:

#### 1. Using Firebase Console:
- Go to Firebase Console → Cloud Messaging
- Click "Send your first message"
- Enter notification title and text
- Select your app
- Send test message

#### 2. Using curl (for testing):
```bash
curl -X POST https://fcm.googleapis.com/fcm/send \
  -H "Authorization: key=YOUR_SERVER_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "to": "DEVICE_FCM_TOKEN",
    "notification": {
      "title": "Test Notification",
      "body": "This is a test message"
    },
    "data": {
      "key1": "value1",
      "key2": "value2"
    }
  }'
```

## 🎯 Features Implemented

### Notification Handling:
- ✅ **Foreground**: Shows local notification when app is open
- ✅ **Background**: Handled by background message handler
- ✅ **Terminated**: Opens app when notification is tapped
- ✅ **Notification Tap**: Handles notification tap events

### Available Methods in FirebaseMessagingService:
```dart
// Get FCM token
String? token = await FirebaseMessagingService().getToken();

// Subscribe to topic
await FirebaseMessagingService().subscribeToTopic('news');

// Unsubscribe from topic
await FirebaseMessagingService().unsubscribeFromTopic('news');

// Listen to messages
FirebaseMessagingService().onMessageStream.listen((message) {
  print('Received message: ${message.notification?.title}');
});
```

## 🔧 Build and Run

### Android:
```bash
flutter run
```

### iOS:
```bash
# After adding GoogleService-Info.plist
cd ios
pod install
cd ..
flutter run
```

## 📝 Notes

- **Android**: Requires Android 13+ for POST_NOTIFICATIONS permission (already added)
- **iOS**: Requires user permission for notifications (handled automatically)
- **Background Messages**: Use `@pragma('vm:entry-point')` annotation (already added)
- **Local Notifications**: Configured for both platforms with default channel

## 🐛 Troubleshooting

### iOS Build Issues:
1. Clean build: `flutter clean && flutter pub get`
2. Clean iOS: `cd ios && pod deintegrate && pod install && cd ..`
3. Open in Xcode and clean build folder

### Android Build Issues:
1. Clean build: `flutter clean && flutter pub get`
2. Rebuild: `cd android && ./gradlew clean && cd ..`

### No Notifications Received:
1. Check FCM token is generated
2. Verify permissions are granted
3. Check Firebase Console for delivery status
4. Ensure app is properly configured in Firebase Console

## 🎉 Next Steps

1. Download and add `GoogleService-Info.plist` to iOS
2. Run `flutter clean && flutter pub get`
3. Test on both Android and iOS devices
4. Implement custom notification handling based on your app's needs
