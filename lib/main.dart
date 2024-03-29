import 'package:consultar_nada_consta/utils/provider.dart';
import 'package:consultar_nada_consta/view/consultar_nada_cosnta.dart';
import 'package:consultar_nada_consta/utils/routes.dart';
import 'package:consultar_nada_consta/view/splash_page.dart';
import 'package:consultar_nada_consta/view/vizualizar_info_nada_consta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: "Pacto Administradora",
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 226, 217, 217)),
      initialRoute: '/splash-page',
      routes: {
        Routes.CONSULTAR_NADA_CONSTA: (context) => const ConsultarNadaConsta(),
        Routes.VISUALIZAR_INFO_NADA_CONSTA: (context) => const VisualizarInfoNadaConsta(),
        Routes.SPLASH_PAGE: (context) => const SplashPage(),
      },
    );
  }
}
