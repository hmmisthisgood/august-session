import 'package:first_app/util/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class UtilFunction {
  static bool isDarkMode(ThemeData currentTheme) {
    bool isDark = currentTheme.scaffoldBackgroundColor == CustomTheme.darkBg;
    return isDark;
  }

  static handlePermissions({required Permission serviceName}) async {
    final status = await serviceName.status;
    print(status);

    if (status == PermissionStatus.granted) {
      // do nothing
    } else if (status == PermissionStatus.denied) {
      await serviceName.request();
    } else if (status == PermissionStatus.permanentlyDenied) {
      /// open phone's settings app and ask user to give the permission

    } else if (status == PermissionStatus.restricted) {} // ios specific
  }
}
