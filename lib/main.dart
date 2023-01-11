import 'package:consultar_nada_consta/view/consultar_nada_cosnta.dart';
import 'package:consultar_nada_consta/utils/routes.dart';
import 'package:consultar_nada_consta/view/vizualizar_info_nada_consta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
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
      initialRoute: '/consultar-nada-consta',
      routes: {
        Routes.CONSULTAR_NADA_CONSTA: (context) => const ConsultarNadaConsta(),
        Routes.VISUALIZAR_INFO_NADA_CONSTA: (context) => const VisualizarInfoNadaConsta(),
      },
    );
  }
}
