import 'package:hayyacom/models/user_model.dart';
import 'package:hayyacom/utils/constants/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHandler {

  static void setUserDate(UserModel userModel) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(PreferencesKeys.accessToken, userModel.token ?? "");
      prefs.setInt(PreferencesKeys.userId, userModel.id ?? 0);
      prefs.setString(PreferencesKeys.userName, userModel.name ?? "");
      prefs.setString(PreferencesKeys.userPhoneNo, userModel.phoneNumber ?? "");
      prefs.setString(PreferencesKeys.userLanguage, userModel.language ?? "");
      //  Old App
      // prefs.setString(PreferencesKeys.userName, userModel.name ?? "");
      prefs.setInt(PreferencesKeys.eventId, userModel.eventId ?? 0);
      prefs.setInt(PreferencesKeys.totalGuest, userModel.totalGuest ?? 0);
      prefs.setString(PreferencesKeys.packageType, userModel.packageType ?? "");
      prefs.setString(PreferencesKeys.sampleInvitationURL, userModel.sampleInvitationURL ?? "");
    });
  }

  static Future<UserModel> getUserData() {
    return SharedPreferences.getInstance().then((prefs) {
      UserModel userModel = UserModel();
      userModel.token = prefs.getString(PreferencesKeys.accessToken);
      userModel.id = prefs.getInt(PreferencesKeys.userId);
      userModel.name = prefs.getString(PreferencesKeys.userName);
      userModel.phoneNumber = prefs.getString(PreferencesKeys.userPhoneNo);
      userModel.language = prefs.getString(PreferencesKeys.userLanguage);
      return userModel;
    });
  }

  static Future<String?> getAccessToken() => SharedPreferences.getInstance()
      .then((prefs) => prefs.getString(PreferencesKeys.accessToken));

  static Future<int?> getUserId() => SharedPreferences.getInstance()
      .then((prefs) => prefs.getInt(PreferencesKeys.userId));

  static Future<String?> getUserName() => SharedPreferences.getInstance()
      .then((prefs) => prefs.getString(PreferencesKeys.userName));

  static Future<String?> getUserPhoneNo() => SharedPreferences.getInstance()
      .then((prefs) => prefs.getString(PreferencesKeys.userPhoneNo));

  static Future<String?> getUserLanguage() => SharedPreferences.getInstance()
      .then((prefs) => prefs.getString(PreferencesKeys.userLanguage));
}