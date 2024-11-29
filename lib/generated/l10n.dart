// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `VCare`
  String get appName {
    return Intl.message(
      'VCare',
      name: 'appName',
      desc: '应用名称',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '首页',
      args: [],
    );
  }

  /// `Mine`
  String get mine {
    return Intl.message(
      'Mine',
      name: 'mine',
      desc: '我的',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '登录',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '注册',
      args: [],
    );
  }

  /// `Click login`
  String get clickLogin {
    return Intl.message(
      'Click login',
      name: 'clickLogin',
      desc: '点击登录',
      args: [],
    );
  }

  /// `Not login`
  String get notLogin {
    return Intl.message(
      'Not login',
      name: 'notLogin',
      desc: '未登录',
      args: [],
    );
  }

  /// `Change theme`
  String get changeTheme {
    return Intl.message(
      'Change theme',
      name: 'changeTheme',
      desc: '切换主题',
      args: [],
    );
  }

  /// `Dark mode`
  String get darkMode {
    return Intl.message(
      'Dark mode',
      name: 'darkMode',
      desc: '夜间模式',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '用户名',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '密码',
      args: [],
    );
  }

  /// `Confirm your password`
  String get passwordAgain {
    return Intl.message(
      'Confirm your password',
      name: 'passwordAgain',
      desc: '确认密码',
      args: [],
    );
  }

  /// `Please Enter your username`
  String get usernamePlaceholder {
    return Intl.message(
      'Please Enter your username',
      name: 'usernamePlaceholder',
      desc: '请输入用户名',
      args: [],
    );
  }

  /// `Please Enter your password`
  String get passwordPlaceholder {
    return Intl.message(
      'Please Enter your password',
      name: 'passwordPlaceholder',
      desc: '请输入密码',
      args: [],
    );
  }

  /// `Please Enter your password again`
  String get passwordAgainPlaceholder {
    return Intl.message(
      'Please Enter your password again',
      name: 'passwordAgainPlaceholder',
      desc: '再次输入密码',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
