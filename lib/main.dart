import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok_clone/features/videos/repos/playback_config_repo.dart';
import 'package:tiktok_clone/features/videos/view_models/playback_config_view_model.dart';
import 'package:tiktok_clone/firebase_options.dart';
import 'package:tiktok_clone/router.dart';

import 'common/widgets/main_navigation/view_models/theme_mode_view_model.dart';
import 'constants/sizes.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final preferences = await SharedPreferences.getInstance();
  final playbackConfigRepository = PlaybackConfigRepository(preferences);

  runApp(
    ProviderScope(
      overrides: [
        playbackConfigProvider.overrideWith(
          () => PlaybackConfigViewModel(
            (playbackConfigRepository),
          ),
        ),
      ],
      child: const TikTokApp(),
    ),
  );
}

class TikTokApp extends ConsumerWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      title: 'Flutter Demo',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      themeMode: ref.watch(themeConfigProvider).themeMode,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        textTheme: Typography.blackCupertino,
        primaryColor: const Color(0xFFE9435A),
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade50,
        ),
        splashColor: Colors.transparent,
        //splashFactory: NoSplash.splashFactory,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
        ),
        tabBarTheme: TabBarTheme(
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade500,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.white,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        textTheme: Typography.whiteCupertino,
        primaryColor: const Color(0xFFE9435A),
        scaffoldBackgroundColor: Colors.black,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade700,
          indicatorColor: Colors.white,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(color: Colors.grey.shade100),
          surfaceTintColor: Colors.grey.shade900,
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey.shade900,
          elevation: 0,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade900,
        ),
      ),
    );
  }
}
