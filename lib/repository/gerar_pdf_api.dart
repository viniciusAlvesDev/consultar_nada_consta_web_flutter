import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class GerarPdfNadaConstaApi {
  pdf(String numValidador) async {
    Uri url = Uri.parse("http://pactolino.com.br/pactoapps/nadaConsta/validar/?numero=$numValidador&formato=pdf");

    Uint8List pdf;

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json;",
    };

    http.Response response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      pdf = response.bodyBytes;
      return pdf;
    } else {
      return null;
    }
  }
}
