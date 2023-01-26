// ignore: file_names
import 'dart:convert';
import 'package:consultar_nada_consta/model/nada_consta_model.dart';
import 'package:http/http.dart' as http;

class ConsultarNadaConstaApi {
  consultar(String numValidador) async {
    NadaConstaModel? nadaConstaModel;

    Uri uri = Uri.parse("http://pactolino.com.br/pactoapps/nadaConsta/validar/?numero=$numValidador");

    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> retorno = jsonDecode(utf8.decode(response.bodyBytes));
      nadaConstaModel = NadaConstaModel.fromJson(retorno);
      return nadaConstaModel;
    } else {
      return null;
    }
  }
}
