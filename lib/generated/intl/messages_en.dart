// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("Vcare"),
        "cannotCommunity": MessageLookupByLibrary.simpleMessage(
            "Cannot get community information"),
        "clickLogin": MessageLookupByLibrary.simpleMessage("Click login"),
        "communityExists": MessageLookupByLibrary.simpleMessage(
            "The community already exists "),
        "communityUrl": MessageLookupByLibrary.simpleMessage("Community URL"),
        "communityUrlPlaceholder":
            MessageLookupByLibrary.simpleMessage("Please enter community URL"),
        "completed": MessageLookupByLibrary.simpleMessage("Completed"),
        "darkMode": MessageLookupByLibrary.simpleMessage("Dark mode"),
        "exitCommunity":
            MessageLookupByLibrary.simpleMessage("Exit the community"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "joinCommunity":
            MessageLookupByLibrary.simpleMessage("Join the community"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "mine": MessageLookupByLibrary.simpleMessage("Mine"),
        "nextStep": MessageLookupByLibrary.simpleMessage("Next step"),
        "notLogin": MessageLookupByLibrary.simpleMessage("Not login"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordAgain":
            MessageLookupByLibrary.simpleMessage("Confirm your password"),
        "passwordAgainPlaceholder": MessageLookupByLibrary.simpleMessage(
            "Please enter your password again"),
        "passwordPlaceholder":
            MessageLookupByLibrary.simpleMessage("Please enter your password"),
        "regexpInternetUrl":
            MessageLookupByLibrary.simpleMessage("The URL is incorrect"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "theme": MessageLookupByLibrary.simpleMessage("Select a theme"),
        "themeColor": MessageLookupByLibrary.simpleMessage("Theme color"),
        "themeSettings": MessageLookupByLibrary.simpleMessage("Theme setting"),
        "username": MessageLookupByLibrary.simpleMessage("Username"),
        "usernamePlaceholder":
            MessageLookupByLibrary.simpleMessage("Please enter your username")
      };
}
