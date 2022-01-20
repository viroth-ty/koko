import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:koko/local_data/share_preference_service.dart';
import 'package:koko/utility/restart_widget.dart';
import 'package:koko/view/home/home_view_model.dart';
import 'package:provider/provider.dart';

import 'view/home/home_view.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: HomeViewModel()),
        ],
        child: const MyApp(),
      ),
  );
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale local = const Locale('en', '');

  Future<void> getLocale() async {
    String service = await SharePreferenceService.getLocale();
    if (service == 'en') {
      service == 'en';
      local = Locale(service, '');
    } else {
      service == 'km';
      local = Locale(service, '');
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async{
      await getLocale();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: local,
      supportedLocales: const [
        Locale('en', ''),
        Locale('km', ''),
      ],
      home: const HomeView(),
    );

  }
}
