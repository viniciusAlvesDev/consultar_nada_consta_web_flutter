import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:file_saver/file_saver.dart';
import 'package:printing/printing.dart';

class BodyVisualizarInfoNadaConsta extends StatefulWidget {
  const BodyVisualizarInfoNadaConsta({super.key});

  @override
  State<BodyVisualizarInfoNadaConsta> createState() => _BodyVisualizarInfoNadaConstaState();
}

class _BodyVisualizarInfoNadaConstaState extends State<BodyVisualizarInfoNadaConsta> {
  TextEditingController controller = TextEditingController();
  // final pdfLib.Document pdf = pdfLib.Document(deflate: zlib.encode);
  Uint8List? pdfDownload;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        double largura = constraint.maxWidth;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
              child: SizedBox(
                width: largura > 900 ? 800 : 500,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 400,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: const [
                                            SizedBox(
                                              width: 110,
                                              child: Text(
                                                "Nº Validador: ",
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "20402.72591.10806",
                                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: const [
                                            SizedBox(
                                              width: 110,
                                              child: Text(
                                                "Data de Emissao: ",
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "05/11/2019",
                                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: const [
                                            SizedBox(
                                              width: 110,
                                              child: Text(
                                                "Período: ",
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "01/10/2013 à 30/10/2019",
                                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: const [
                                            SizedBox(
                                              width: 110,
                                              child: Text(
                                                "Unidade: ",
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "A-2002",
                                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: const [
                                            SizedBox(
                                              width: 110,
                                              child: Text(
                                                "Condomínio: ",
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "2313 - ED. UNICRED",
                                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: const [
                                            SizedBox(
                                              width: 110,
                                              child: Text(
                                                "Endereço: ",
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "AV. BRASIL, 1053 / 5º ANDAR",
                                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: const [
                                            SizedBox(
                                              width: 110,
                                              child: Text(
                                                "Identificador: ",
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "23131500501",
                                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
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
                                      width: largura > 900 ? 300 : 150,
                                      child: Image.asset(
                                        "images/3.png",
                                        color: Colors.grey[300],
                                        colorBlendMode: BlendMode.darken,
                                      ),
                                    )
                                  : Container(),
                            ],
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
                              // const title = 'Certificado Nada Consta';
                              pdfDownload = await _generatePdf();
                              await FileSaver.instance.saveFile("CertificadoNadaCosta", pdfDownload!, ".pdf", mimeType: MimeType.PDF);
                            },
                            child: const Text("Download relatorio"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              // const title = 'Certificado Nada Consta';
                              await Printing.layoutPdf(onLayout: (format) => _generatePdf());
                            },
                            child: const Text("Imprimir relatorio"),
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
      },
    );
  }

  Future<Uint8List> _generatePdf() async {
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
                                      "20402.72591.10806",
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
                                      "05/11/2019",
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
                                      "01/10/2013 à 30/10/2019",
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
                                      "A-2002",
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
                                      "2313 - ED. UNICRED",
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
                                      "AV. BRASIL, 1053 / 5º ANDAR",
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
                                      "23131500501",
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
