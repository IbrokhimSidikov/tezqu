import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import '../services/version_service.dart';
import '../widgets/force_update_dialog.dart';

class VersionChecker {
  static Future<bool> checkAndShowUpdateDialog(BuildContext context) async {
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;
      final versionService = VersionService(remoteConfig);
      await versionService.initialize();
      
      final updateStatus = await versionService.checkForUpdate();
      
      if (updateStatus.isUpdateRequired || updateStatus.isUpdateAvailable) {
        if (context.mounted) {
          await showDialog(
            context: context,
            barrierDismissible: !updateStatus.isUpdateRequired,
            builder: (context) => ForceUpdateDialog(
              updateStatus: updateStatus,
            ),
          );
        }
        
        return true;
      }
      
      return false;
    } catch (e) {
      print('Error checking version: $e');
      return false;
    }
  }
}
