# Flutter Template App

Flutter template app for building quick android and ios apps.

## Installation

After clonning the repository navigate to root directory and run following commands and you are ready to go.

```bash
flutter pub get
flutter run
```

## Setup

In order login to work you need to change api address in [rest_api.dart](https://github.com/petarstojanovic/Flutter-Template-App/blob/master/lib/database/rest_api.dart) file

```dart
class RestApi {
  NetworkUtil _netUtil = new NetworkUtil();
  static const BASE_URL = "http://192.168.0.105/login_app_backend";
  static const LOGIN_URL = BASE_URL + "/login.php";
  static const _API_KEY = "somerandomkey";
```

Login method expects return value in json form

```json
{"user":{"username":"usrname","password":"secretword"}, "error":false}
```
