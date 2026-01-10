# Firebase Remote Config - Force Update Setup Guide

## Overview
This guide will help you set up Firebase Remote Config to force users to update your app to the latest version.

**Current App Version:** `1.2.0` (from pubspec.yaml)

## Step 1: Install Dependencies

Run the following command to install the new dependencies:

```bash
flutter pub get
```

This will install:
- `firebase_remote_config: ^5.1.5` - For remote configuration
- `package_info_plus: ^8.1.2` - To get current app version

## Step 2: Configure Firebase Console

### 2.1 Access Remote Config
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project: **tezqu**
3. In the left sidebar, click **Remote Config** (under Engage section)

### 2.2 Add Configuration Parameters

Click **"Add parameter"** and create the following parameters:

#### Parameter 1: `force_update_enabled`
- **Parameter key:** `force_update_enabled`
- **Data type:** Boolean
- **Default value:** `false` (set to `true` when you want to force updates)
- **Description:** Enable or disable force update feature

#### Parameter 2: `android_min_version`
- **Parameter key:** `android_min_version`
- **Data type:** String
- **Default value:** `1.0.0`
- **Description:** Minimum required version for Android. Users below this version will be forced to update.

#### Parameter 3: `ios_min_version`
- **Parameter key:** `ios_min_version`
- **Data type:** String
- **Default value:** `1.0.0`
- **Description:** Minimum required version for iOS (for future use)

#### Parameter 4: `update_message_title`
- **Parameter key:** `update_message_title`
- **Data type:** String
- **Default value:** `Yangilanish kerak`
- **Description:** Title shown in the update dialog (Uzbek: "Update Required")

#### Parameter 5: `update_message_body`
- **Parameter key:** `update_message_body`
- **Data type:** String
- **Default value:** `Ilovadan foydalanishni davom ettirish uchun yangi versiyaga yangilang.`
- **Description:** Message body (Uzbek: "Please update to the latest version to continue using the app.")

#### Parameter 6: `update_button_text`
- **Parameter key:** `update_button_text`
- **Data type:** String
- **Default value:** `Yangilash`
- **Description:** Button text (Uzbek: "Update")

### 2.3 Publish Changes
After adding all parameters, click **"Publish changes"** in the top right corner.

## Step 3: Update Play Store Link

Edit the file: `lib/core/widgets/force_update_dialog.dart`

Find this line (around line 48):
```dart
? 'https://play.google.com/store/apps/details?id=com.tezqu.app'
```

Replace `com.tezqu.app` with your actual **package name** from `android/app/build.gradle`.

## Step 4: Testing the Force Update

### Test Scenario 1: No Update Required
1. In Firebase Console, set `force_update_enabled` = `false`
2. Publish changes
3. Launch your app
4. App should load normally without showing update dialog

### Test Scenario 2: Force Update Required
1. In Firebase Console, set:
   - `force_update_enabled` = `true`
   - `android_min_version` = `1.3.0` (higher than current 1.2.0)
2. Publish changes
3. **Wait 1-2 minutes** for changes to propagate
4. Close and restart your app
5. You should see the force update dialog
6. Dialog should show:
   - Current version: 1.2.0
   - Required version: 1.3.0
   - Update button

### Test Scenario 3: Version Matches
1. In Firebase Console, set:
   - `force_update_enabled` = `true`
   - `android_min_version` = `1.2.0` (same as current)
2. Publish changes
3. Launch your app
4. App should load normally (no update required)

## Step 5: Production Workflow

### When Releasing a New Version:

1. **Update pubspec.yaml version:**
   ```yaml
   version: 1.3.0+8  # Increment version number
   ```

2. **Build and upload to Play Store**

3. **After Play Store approval, update Firebase Remote Config:**
   - Set `android_min_version` to the previous version (e.g., `1.2.0`)
   - Set `force_update_enabled` to `true`
   - Publish changes

4. **Users on older versions will now be forced to update**

### Example Timeline:
- **Day 1:** Release v1.3.0 to Play Store
- **Day 2:** Play Store approves and publishes
- **Day 3:** Update Firebase Remote Config:
  - `android_min_version` = `1.2.0`
  - `force_update_enabled` = `true`
- **Result:** All users on v1.2.0 and below must update to v1.3.0

## How It Works

### Version Comparison Logic
The app compares versions using semantic versioning (MAJOR.MINOR.PATCH):

```
Current: 1.2.0
Minimum: 1.3.0
Result: Update required ✓

Current: 1.3.0
Minimum: 1.2.0
Result: No update needed ✓

Current: 1.3.5
Minimum: 1.3.0
Result: No update needed ✓
```

### User Experience Flow

1. **App Launch** → Splash screen appears
2. **Version Check** → App fetches Remote Config
3. **If Update Required:**
   - Show force update dialog (non-dismissible)
   - Display current vs required version
   - "Update" button opens Play Store
   - User cannot proceed without updating
4. **If No Update Required:**
   - App continues to home screen normally

## Customization

### Change Dialog Text
Edit `lib/core/widgets/force_update_dialog.dart` to customize:
- Colors (currently uses `Color(0xFF5FCCB4)`)
- Layout and styling
- Icons

### Change Remote Config Values
Update in Firebase Console:
- `update_message_title` - Dialog title
- `update_message_body` - Dialog message
- `update_button_text` - Button text

### Adjust Fetch Interval
Edit `lib/core/services/remote_config_service.dart`:
```dart
minimumFetchInterval: const Duration(hours: 1), // Change this
```

## Troubleshooting

### Issue: Update dialog not showing
**Solutions:**
1. Check Firebase Console - ensure `force_update_enabled` is `true`
2. Wait 1-2 minutes after publishing changes
3. Force close and restart the app
4. Check logs for "Remote Config initialized successfully"

### Issue: Wrong version comparison
**Solutions:**
1. Verify `pubspec.yaml` version format: `MAJOR.MINOR.PATCH+BUILD`
2. Check Firebase Console `android_min_version` format: `MAJOR.MINOR.PATCH`
3. Don't include `+BUILD` number in Remote Config

### Issue: Play Store link not working
**Solutions:**
1. Verify package name in `force_update_dialog.dart`
2. Ensure app is published on Play Store
3. Test with actual Play Store URL

## Important Notes

- ⚠️ **Test thoroughly** before enabling in production
- 🔄 Remote Config changes take 1-2 minutes to propagate
- 📱 Users must have internet connection for version check
- 🚫 Force update dialog is **non-dismissible** - users must update
- ⏱️ Fetch interval is set to 1 hour (configurable)
- 🌐 Requires active internet connection on app launch

## Files Modified/Created

1. ✅ `pubspec.yaml` - Added dependencies
2. ✅ `lib/core/services/remote_config_service.dart` - Remote Config service
3. ✅ `lib/core/widgets/force_update_dialog.dart` - Update dialog UI
4. ✅ `lib/core/utils/version_checker.dart` - Version checking utility
5. ✅ `lib/features/onboard/presentation/pages/splash_page.dart` - Added version check
6. ✅ `lib/main.dart` - Initialize Remote Config

## Next Steps

1. ✅ Run `flutter pub get`
2. ⏳ Configure Firebase Console parameters
3. ⏳ Update Play Store link in `force_update_dialog.dart`
4. ⏳ Test with different scenarios
5. ⏳ Deploy to production when ready
