import "package:flutter/material.dart";

class Constants {
  static const name = "name";
  static const legalName = "legal_name";
  static const color = "color";

  /// Collections
  static const usersCollection = "users_collection";
  static const bookMarkCollection = "bookmarks_articles";
  static const playerCollection = "player_collection";
  static const notificationsCollection = "notifications_collection";
  static const firebaseStorageMetadataCollection =
      "firebase_storage_metadata_collection";
  static const notificationsSettingsCollection =
      "notifications_settings_collection";

  /// cloud function names

  /// cloud function variables

  /// phone model
  static const nationalNumber = "national_number";
  static const internationalNumber = "international_number";
  static const countryCode = "country_code";
  static const countryCallingCode = "country_calling_code";
  static const uri = "uri";
  static const callingCode = "calling_code";

  ///user_information_model
  static const birthDate = 'birth_date';
  static const gender = 'gender';
  static const country = 'country';
  static const language = 'language';

  ///users_collection
  static const email = "email";
  static const password = "password";
  static const firstName = "first_name";
  static const lastName = "last_name";
  static const userName = "username";
  static const mobile = "mobile";
  static const status = "status";
  static const depthPreference = "depth_preference";
  static const voicePreference = "voice_preference";
  static const infocastsLength = "infocasts_length";
  static const fcmToken = "fcm_token";
  static const emailVerified = "email_verified";
  static const censorLanguage = "censor_language";
  static const notificationBreakingNews = "notification_breakingNews";
  static const imageUrl = "image_url";
  static const imagePath = "image_path";
  static const timezone = "timezone";
  static const phoneModel = "phone_model";
  static const userInfoModel = "user_info_model";
  static const interestsModel = "interests_model";
  static const themeModel = "theme_model";
  static const usedFlexColorSchemeIndex = "used_flex_color_scheme_index";
  static const usedFlexThemeMode = "used_flex_theme_mode";
  static const useMaterial3 = "use_material_3";
  static const textScaleFactor = "text_scale_factor";
  static const quickActionsList = "quick_actions_list";
  static const deviceId = "device_id";
  static const osVersion = "os_version";
  static const deviceModel = "device_model";
  static const installedAppVersion = "installed_app_version";
  static const selectedInterests = "selected_interests";
  static const selectedPerInterests = "selected_personal_interests";

  /// getStoarge
  static const userId = "user_id";
  static const userEmail = "user_email";
  static const userPhoneNumber = "user_phone_number";
  static const isFirst = "is_first";
  static const isDarkMode = "is_dark_mode";

  //Screen names
  static const homeScreen = "Home";
  static const settingsScreen = "Settings";
  static const loginScreen = "Login";
  static const createAccountScreen = "Create Account";
  static const notificationsScreen = "Notifications";
  static const manageTheme = "Manage Theme";
  static const mainScreen = "Main";
  static const phoneVerificationScreen = "Phone Verification";
  static const accountSettingsScreen = "Account Settings";
  static const notificationsSettingsScreen = "Notifications Settings";

  //notifications_collection
  static const latestOpenNotification = "latest_open_notification";
  static const isRead = "is_read";
  static const category = "category";
  static const modelId = "model_id";
  static const modelType = "model_type";

  //firebase_storage_metadata_collection
  static const size = "size";
  static const contentType = "content_type";
  static const formattedSize = "formatted_size";
  static const referenceType = "reference_type";
  static const referenceId = "reference_id";
  static const extension = "extension";

  //notifications_settings_collection
  static const notificationsSettings = "notifications_settings";
  static const generalUpdates = "general_updates";
  static const promotionalNotifications = "promotional_notifications";
  static const userDevices = "user_devices";

  // notifications_collection
  static const body = "body";
  static const title = "title";

  //country
  static const dialCode = "dial_code";
  static const code = "code";
  static const flag = "flag";

  /// timestamps
  static const createdAt = "_created_at";
  static const updatedAt = "_updated_at";

  ///cloud function contrast
  static const callPodcastGenerateFunction = 'call_generate_podcast_for_interest';
  static const callSubPodcastGenerateFunction = 'call_generate_sub_podcast_for_interest';
  static const getUserSpecificBriefsFunction = 'get_user_specific_briefs';
  static const getTrendingNewsFunction = 'get_trending_news';
  static const recommendArticlesForUser = 'recommend_articles_for_user';
  static const searchAlg = 'search_alg';

  // general
  static const id = "id";
  static const openAppTimes = "open_app_times";
  static const account = "Account";
  static const client = "Client";
  static const service = "Service";
  static const phone = "phone";
  static const main = "Main";
  static const url = "url";
  static const mimeType = "mime_type";
  static const fileExtension = "file_extension";
  static const profileImage = "Profile Image";
  static const pdfStorage = "Pdf";
  static const symbol = "symbol";
  static const image = "image";
  static const dateAsc = "Date Asc";
  static const dateDesc = "Date Desc";
  static const totalAsc = "Total Asc";
  static const totalDesc = "Total Desc";
  static const amountAsc = "Amount Asc";
  static const amountDesc = "Amount Desc";
  static const sizeDesc = "Size Desc";
  static const sizeAsc = "Size Asc";
  static const isEnabled = "is_enabled";
  static const suspended = "Suspended";
  static const activeStatus = "Active";
  static const pending = "Pending";
  static const completed = "Completed";
  static const done = "Done";
  static const open = "Open";
  static const viewed = "Viewed";
  static const accepted = "Accepted";
  static const scheduled = "Scheduled";
  static const declined = "Declined";
  static const paid = "Paid";
  static const all = "All";
  static const read = "Read";
  static const unread = "Unread";
  static const sent = "Sent";
  static const notSubscribed = "notSubscribed";
  static const upgrade = "upgrade";
  static const appVersionNumber = "2024.03.05";
  static const appVersionCollection = "app_version";
  static const appVersionDocument = "appVersion";
  static const vapidKey = "vapidKey";
  static const path = "path";
  static const custom = "custom";

  static GlobalKey<ScaffoldState> globalScaffoldKey =
      GlobalKey<ScaffoldState>();

  static const accountSettingsSectionPadding = 16.0;

// static const firebaseOptions = FirebaseOptions(
//   apiKey: "tttt",
//   authDomain: "ttt-369.firebaseapp.com",
//   projectId: "tt-369",
//   storageBucket: "wtt.appspot.com",
//   messagingSenderId: "f",
//   appId: "1:666104098",
//   measurementId: "G",
// );
}
