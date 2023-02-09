import 'dart:io';
import 'dart:typed_data';
import 'package:consultar_nada_consta/repository/gerar_pdf_api.dart';
import 'package:flutter/material.dart';

class GerarPdfNadaConstaController extends ChangeNotifier {
  Uint8List? pdf;
  GerarPdfNadaConstaApi repository = GerarPdfNadaConstaApi();
  bool carregando = false;

  Future refresh(String numValidador) async {
    carregando = true;
    notifyListeners();

    try {
      carregando = true;
      pdf = await repository.pdf(numValidador);
      carregando = false;
      notifyListeners();
    } catch (e) {
      carregando = false;
      notifyListeners();
    }
  }
}
