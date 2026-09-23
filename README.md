# 📝 To-Do App

A simple and modern To-Do application built with Flutter and Dart.

This project helps users organize their daily tasks through a clean, user-friendly interface with multilingual support.

## 📱 App Screens
<p align="center">
  <img src="screenshots/splash.png" width="200">
  <img src="screenshots/english_login.png" width="200">
  <img src="screenshots/arabic_login.png" width="200">
  <img src="screenshots/language_option.png" width="200">
</p>



<details>
<summary>🌍 Generate Localization Keys</summary>

```bash
dart run easy_localization:generate --source-dir ./assets/translations -f keys -o locale_keys.g.dart -O lib/gen
