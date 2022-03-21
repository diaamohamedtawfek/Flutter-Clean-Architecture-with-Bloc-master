import 'package:common/common.dart';

class CurrentAppFlavor {
  static late final AppFlavor _appFlavor;
  static AppFlavor useDevFlavor() {
    return _appFlavor =
        AppFlavor(appName: "Sample App Development", flavor: FLAVOR.DEV);
  }

  static AppFlavor useProdFlavor() {
    return _appFlavor =
        AppFlavor(appName: "Sample App Production", flavor: FLAVOR.PROD);
  }

  static AppFlavor get currentAppFlavor {
    return _appFlavor;
  }
}
