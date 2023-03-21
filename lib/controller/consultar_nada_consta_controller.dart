// ignore_for_file: unnecessary_null_comparison

import 'package:consultar_nada_consta/model/nada_consta_model.dart';
import 'package:consultar_nada_consta/repository/consultar_nada_consta_api.dart';
import 'package:flutter/material.dart';

class ConsultarNadaConstaController extends ChangeNotifier {
  NadaConstaModel? nadaConstaModel = NadaConstaModel();
  ConsultarNadaConstaApi repository = ConsultarNadaConstaApi();
  bool carregando = false;

  Future getValidaData(String numValidador) async {
    try {
      carregando = true;
      nadaConstaModel = await repository.consultar(numValidador);
      carregando = false;
      notifyListeners();
    } catch (e) {
      carregando = false;
      return e;
    }
  }
}
