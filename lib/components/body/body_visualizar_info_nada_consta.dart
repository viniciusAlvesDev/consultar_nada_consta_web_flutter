import 'dart:ui';
import 'package:consultar_nada_consta/controller/consultar_nada_consta_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'dart:convert';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:file_saver/file_saver.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

class BodyVisualizarInfoNadaConsta extends StatefulWidget {
  const BodyVisualizarInfoNadaConsta({super.key});

  @override
  State<BodyVisualizarInfoNadaConsta> createState() => _BodyVisualizarInfoNadaConstaState();
}

class _BodyVisualizarInfoNadaConstaState extends State<BodyVisualizarInfoNadaConsta> {
  TextEditingController controller = TextEditingController();
  Uint8List? pdfDownload;

  String? numero = "";
  String? dataEmissao = "";
  String? periodo = "";
  String? numCondominio = "";
  String? nomeCondominio = "";
  String? enderecoCondominio = "";

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        double largura = constraint.maxWidth;
        return Consumer<ConsultarNadaConstaController>(builder: (
          context,
          consultarNadaConstaController,
          child,
        ) {
          var numValidador = consultarNadaConstaController.nadaConstaModel?.numero;
          final exp = RegExp(r"(\d{5})+\.?(\d{5})+\.?(\d{5})+\.?");
          if (exp.hasMatch(numValidador!)) {
            Iterable<Match> matches = exp.allMatches(numValidador);
            for (var n in matches) {
              numero = '${n.group(1)}.${n.group(2)}.${n.group(3)}';
            }
          } else {
            numero = "";
          }
          DateTime dataConvertida = DateTime.parse(consultarNadaConstaController.nadaConstaModel!.dataEmisssao!);
          String day = dataConvertida.day < 10 ? "0${dataConvertida.day}" : "${dataConvertida.day}";
          String month = dataConvertida.month < 10 ? "0${dataConvertida.month}" : "${dataConvertida.month}";
          dataEmissao = "$day/$month/${dataConvertida.year}";
          periodo = consultarNadaConstaController.nadaConstaModel?.periodo;
          numCondominio = consultarNadaConstaController.nadaConstaModel?.condominioNumero;
          nomeCondominio = consultarNadaConstaController.nadaConstaModel?.condominioNome;
          enderecoCondominio = consultarNadaConstaController.nadaConstaModel?.condominioEndereco;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Center(
                child: SizedBox(
                  width: largura > 900 ? 850 : 500,
                  child: Column(
                    children: [
                      Container(
                        height: 45,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.date_range),
                                const SizedBox(width: 10),
                                Text(
                                  "NADA CONSTA",
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo[900]),
                                ),
                                const SizedBox(width: 100),
                                const Tooltip(
                                  message: "\nEsse ambiente te proporciona a opção de cadastrar novos espaços!\n\n\nOBS: Para realizar o cadastro de uma nova reserva, é necessário preencher \ntodos os campos do formulário.\n",
                                  child: Icon(Icons.info_outline),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: largura * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: largura * 0.80,
                                decoration: BoxDecoration(
                                  color: Colors.green[100],
                                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Wrap(
                                    runSpacing: 10,
                                    children: const [
                                      Text(
                                        "NADA CONSTA: ",
                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 5),
                                      Text("Espaço reservado a descrição e explicação do documento. sssssssssssssssssss ssssssssssssssssss ssssssssssssssssss ssssssssssssss sssssssssssss s sssssssssssss ssss ssssssssssssssss ss"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: largura > 900 ? largura * 0.8 : largura * 0.55,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: largura > 900 ? 450 : largura * 0.50,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Wrap(
                                              children: [
                                                const SizedBox(
                                                  width: 110,
                                                  child: Text(
                                                    "Nº Validador: ",
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  numero!,
                                                  style: TextStyle(color: Colors.indigo[900], fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Wrap(
                                              children: [
                                                const SizedBox(
                                                  width: 110,
                                                  child: Text(
                                                    "Data de Emissao: ",
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  dataEmissao!,
                                                  style: TextStyle(color: Colors.indigo[900], fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Wrap(
                                              children: [
                                                const SizedBox(
                                                  width: 110,
                                                  child: Text(
                                                    "Período: ",
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  periodo!,
                                                  style: TextStyle(color: Colors.indigo[900], fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Wrap(
                                              children: [
                                                const SizedBox(
                                                  width: 110,
                                                  child: Text(
                                                    "Unidade: ",
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  numCondominio!,
                                                  style: TextStyle(color: Colors.indigo[900], fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 400,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Wrap(
                                                children: [
                                                  const SizedBox(
                                                    width: 110,
                                                    child: Text(
                                                      "Condomínio: ",
                                                      style: TextStyle(fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Text(
                                                    nomeCondominio!,
                                                    style: TextStyle(color: Colors.indigo[900], fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Wrap(
                                              children: [
                                                const SizedBox(
                                                  width: 110,
                                                  child: Text(
                                                    "Endereço: ",
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  enderecoCondominio!,
                                                  style: TextStyle(color: Colors.indigo[900], fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Wrap(
                                              children: [
                                                const SizedBox(
                                                  width: 110,
                                                  child: Text(
                                                    "Identificador: ",
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  numero!,
                                                  style: TextStyle(color: Colors.indigo[900], fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  largura > 900
                                      ? SizedBox(
                                          width: largura > 900 ? 250 : 150,
                                          child: Image.asset(
                                            "assets/images/3.png",
                                            color: Colors.grey[300],
                                            colorBlendMode: BlendMode.darken,
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                pdfDownload = await _generatePdf(numero, dataEmissao, periodo, numCondominio, nomeCondominio, enderecoCondominio);
                                await FileSaver.instance.saveFile("CertificadoNadaCosta", pdfDownload!, ".pdf", mimeType: MimeType.PDF);
                              },
                              child: const Text("Download"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                await Printing.layoutPdf(onLayout: (format) => _generatePdf(numero, dataEmissao, periodo, numCondominio, nomeCondominio, enderecoCondominio));
                              },
                              child: const Text("Imprimir"),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      },
    );
  }

  Future<Uint8List> _generatePdf(String? numero, String? dataEmissao, String? periodo, String? numCondominio, String? nomeCondominio, String? enderecoCondominio) async {
    final pdf = pdfLib.Document();

    pdf.addPage(
      pdfLib.Page(
        build: (context) {
          return pdfLib.Center(
            child: pdfLib.Container(
              decoration: const pdfLib.BoxDecoration(
                borderRadius: pdfLib.BorderRadius.only(
                  bottomLeft: pdfLib.Radius.circular(15),
                  bottomRight: pdfLib.Radius.circular(15),
                ),
              ),
              child: pdfLib.Column(
                children: [
                  pdfLib.Padding(
                    padding: const pdfLib.EdgeInsets.all(8.0),
                    child: pdfLib.Container(
                      width: 600,
                      decoration: const pdfLib.BoxDecoration(
                        borderRadius: pdfLib.BorderRadius.all(pdfLib.Radius.circular(15)),
                      ),
                      child: pdfLib.Padding(
                        padding: const pdfLib.EdgeInsets.all(20.0),
                        child: pdfLib.Wrap(
                          runSpacing: 10,
                          children: [
                            pdfLib.Text(
                              "NADA CONSTA: ",
                              style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold),
                            ),
                            pdfLib.SizedBox(height: 5),
                            pdfLib.Text("Espaço reservado a descrição e explicação do documento. sssssssssssssssssss ssssssssssssssssss ssssssssssssssssss ssssssssssssss sssssssssssss s sssssssssssss ssss ssssssssssssssss ss"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  pdfLib.Row(
                    mainAxisAlignment: pdfLib.MainAxisAlignment.spaceAround,
                    children: [
                      pdfLib.SizedBox(
                        width: 400,
                        child: pdfLib.Padding(
                          padding: const pdfLib.EdgeInsets.all(20.0),
                          child: pdfLib.Column(
                            children: [
                              pdfLib.Padding(
                                padding: const pdfLib.EdgeInsets.all(8.0),
                                child: pdfLib.Row(
                                  children: [
                                    pdfLib.SizedBox(
                                      width: 110,
                                      child: pdfLib.Text(
                                        "Nº Validador: ",
                                        style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold),
                                      ),
                                    ),
                                    pdfLib.SizedBox(width: 10),
                                    pdfLib.Text(
                                      numero!,
                                    ),
                                  ],
                                ),
                              ),
                              pdfLib.Padding(
                                padding: const pdfLib.EdgeInsets.all(8.0),
                                child: pdfLib.Row(
                                  children: [
                                    pdfLib.SizedBox(
                                      width: 110,
                                      child: pdfLib.Text(
                                        "Data de Emissao: ",
                                        style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold),
                                      ),
                                    ),
                                    pdfLib.SizedBox(width: 10),
                                    pdfLib.Text(
                                      dataEmissao!,
                                    ),
                                  ],
                                ),
                              ),
                              pdfLib.Padding(
                                padding: const pdfLib.EdgeInsets.all(8.0),
                                child: pdfLib.Row(
                                  children: [
                                    pdfLib.SizedBox(
                                      width: 110,
                                      child: pdfLib.Text(
                                        "Período: ",
                                        style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold),
                                      ),
                                    ),
                                    pdfLib.SizedBox(width: 10),
                                    pdfLib.Text(
                                      periodo!,
                                    ),
                                  ],
                                ),
                              ),
                              pdfLib.Padding(
                                padding: const pdfLib.EdgeInsets.all(8.0),
                                child: pdfLib.Row(
                                  children: [
                                    pdfLib.SizedBox(
                                      width: 110,
                                      child: pdfLib.Text(
                                        "Unidade: ",
                                        style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold),
                                      ),
                                    ),
                                    pdfLib.SizedBox(width: 10),
                                    pdfLib.Text(
                                      numCondominio!,
                                    ),
                                  ],
                                ),
                              ),
                              pdfLib.Padding(
                                padding: const pdfLib.EdgeInsets.all(8.0),
                                child: pdfLib.Row(
                                  children: [
                                    pdfLib.SizedBox(
                                      width: 110,
                                      child: pdfLib.Text(
                                        "Condomínio: ",
                                        style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold),
                                      ),
                                    ),
                                    pdfLib.SizedBox(width: 10),
                                    pdfLib.Text(
                                      nomeCondominio!,
                                    ),
                                  ],
                                ),
                              ),
                              pdfLib.Padding(
                                padding: const pdfLib.EdgeInsets.all(8.0),
                                child: pdfLib.Row(
                                  children: [
                                    pdfLib.SizedBox(
                                      width: 110,
                                      child: pdfLib.Text(
                                        "Endereço: ",
                                        style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold),
                                      ),
                                    ),
                                    pdfLib.SizedBox(width: 10),
                                    pdfLib.Text(
                                      enderecoCondominio!,
                                    ),
                                  ],
                                ),
                              ),
                              pdfLib.Padding(
                                padding: const pdfLib.EdgeInsets.all(8.0),
                                child: pdfLib.Row(
                                  children: [
                                    pdfLib.SizedBox(
                                      width: 110,
                                      child: pdfLib.Text(
                                        "Identificador: ",
                                        style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold),
                                      ),
                                    ),
                                    pdfLib.SizedBox(width: 10),
                                    pdfLib.Text(
                                      numero,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

    return pdf.save();
  }
}
