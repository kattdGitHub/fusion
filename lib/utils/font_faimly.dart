class AppFont {
  static const String yellowtailRegular = "Yellowtail Regular";
  static const String latoRegular = "Lato Regular";

  // Private constructor to prevent instantiation
  AppFont._();

  // Singleton instance
  static final AppFont _instance = AppFont._();

  // Getter to access the singleton instance
  static AppFont get instance => _instance;
}
