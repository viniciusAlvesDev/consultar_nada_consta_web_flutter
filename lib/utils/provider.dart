import 'package:consultar_nada_consta/controller/gerar_pdf_controller.dart';
import 'package:provider/provider.dart';
import 'package:consultar_nada_consta/controller/consultar_nada_consta_controller.dart';

final providers = [
  ChangeNotifierProvider<ConsultarNadaConstaController>(
    create: (context) => ConsultarNadaConstaController(),
  ),
  ChangeNotifierProvider<GerarPdfNadaConstaController>(
    create: (context) => GerarPdfNadaConstaController(),
  ),
];
