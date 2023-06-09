// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
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
  String get localeName => 'ko';

  static String m0(value) => "${value}";

  static String m1(value, value2) =>
      "${value} ${Intl.plural(value2, zero: '노 댓글', one: '댓글', other: '댓글s')}";

  static String m2(value) => "${value}";

  static String m3(gender) =>
      "Log in ${Intl.gender(gender, female: 'madam', male: 'sir', other: 'human')}";

  static String m4(nameOfTheApp) => "${nameOfTheApp}에 로그인하세요";

  static String m5(videoCount) =>
      "Create a profile, follow other accounts, make your own ${Intl.plural(videoCount, zero: 'no videos', one: 'video', other: 'videos')}, and more.";

  static String m6(nameOfTheApp, when) => "${nameOfTheApp}에 가입하세요 ${when}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "bioHeader": MessageLookupByLibrary.simpleMessage("자기소개"),
        "changeAvatarHeader": MessageLookupByLibrary.simpleMessage("사진 변경"),
        "commentCount": m0,
        "commentTitle": m1,
        "complete": MessageLookupByLibrary.simpleMessage("완료"),
        "likeCount": m2,
        "linkHeader": MessageLookupByLibrary.simpleMessage("링크"),
        "logIn": m3,
        "loginTitle": m4,
        "nameHeader": MessageLookupByLibrary.simpleMessage("이름"),
        "profileEditTitle": MessageLookupByLibrary.simpleMessage("프로필 편집"),
        "signUpSubtitle": m5,
        "signUpTitle": m6,
        "uidHeader": MessageLookupByLibrary.simpleMessage("TikTok ID"),
        "userInfo": MessageLookupByLibrary.simpleMessage("회원 정보")
      };
}
