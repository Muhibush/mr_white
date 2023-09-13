import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_white/utils/navigator/routes.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(

        /// TODO //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
        /// add mobile and tablet if needed
        designSize: const Size(360, 640),
        builder: (context, child) {
          return MaterialApp(
            title: S.current.mrWhite,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            onGenerateRoute: Routes.getRouteGenerate,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: Builder(
                  builder: (context) => child ?? const SizedBox.shrink(),
                ),
              );
            },
          );
        });
  }
}
