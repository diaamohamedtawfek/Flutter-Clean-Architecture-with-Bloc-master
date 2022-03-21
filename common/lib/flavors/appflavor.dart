class AppFlavor {
  late final String appName;
  late final FLAVOR flavor;
  AppFlavor({required this.appName, required this.flavor});
}

enum FLAVOR { DEV, PROD }
