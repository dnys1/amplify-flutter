/// The categories available in Amplify Flutter.
enum CategoryType {
  /// Record app metrics and analytics data
  analytics,

  /// Retrieve data from a remote service
  api,

  /// Authentication
  auth,

  /// Persist data
  dataStore,

  /// Listen for or dispatch Amplify events
  hub,

  /// Log Amplify and app messages
  // logging,

  /// Prediction
  // predictions,

  /// Upload and download files from the cloud
  storage,
}

/// Helpers for [CategoryType].
extension CategoryTypeX on CategoryType {
  /// Display name of the category.
  String get displayName {
    switch (this) {
      case CategoryType.analytics:
        return 'Analytics';
      case CategoryType.api:
        return 'API';
      case CategoryType.auth:
        return 'Auth';
      case CategoryType.dataStore:
        return 'DataStore';
      case CategoryType.hub:
        return 'Hub';
      case CategoryType.storage:
        return 'Storage';
    }
  }

  /// The raw value of the category type.
  String get rawValue => toString().split('.')[1];

  /// Used in `fromJson` handlers for deserializing the category type.
  ///
  /// Throws [StateError] if [categoryType] is not valid.
  static CategoryType fromJson(String categoryType) =>
      CategoryType.values.firstWhere((e) => e.rawValue == categoryType);
}
