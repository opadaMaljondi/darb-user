import 'dart:io';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restart_tagxi/db/app_database.dart';

import '../features/language/domain/models/language_listing_model.dart';

class AppConstants {
  static const String title = 'Darb';
  static const String baseUrl = 'http://77.37.86.152:8080/';
  static String firbaseApiKey = (Platform.isAndroid)
      ? "AIzaSyA8ExnizcqO56a9XKukZ8pHv94Jnvrkzjg"
      : "AIzaSyA8ExnizcqO56a9XKukZ8pHv94Jnvrkzjg";
  static String firebaseAppId =
      (Platform.isAndroid) ? "1:762514158358:android:6390b1b7683da549c79637" : "1:762514158358:android:6390b1b7683da549c79637";
  static String firebasemessagingSenderId = (Platform.isAndroid)
      ? "762514158358"
      : "762514158358";
  static String firebaseProjectId = (Platform.isAndroid)
      ? "taxi-app-6817e"
      : "taxi-app-6817e";

  static String mapKey =
      (Platform.isAndroid) ? 'AIzaSyA2qUtmctQby-4y7uRZOlkM9wOR8DhXis8' : 'AIzaSyA2qUtmctQby-4y7uRZOlkM9wOR8DhXis8';
  static const String stripPublishKey = '';

  static List<LocaleLanguageList> languageList = [
    LocaleLanguageList(name: 'English', lang: 'en'),
    LocaleLanguageList(name: 'Arabic', lang: 'ar'),
    LocaleLanguageList(name: 'Azerbaijani', lang: 'az'),
    LocaleLanguageList(name: 'French', lang: 'fr'),
    LocaleLanguageList(name: 'Spanish', lang: 'es'),
  ];

  static String packageName = 'com.axios.darb';
  static String signKey = '';
  static LatLng currentLocations = const LatLng(0, 0);
}

AppDatabase db = AppDatabase();
bool isAppMapChange = false;
