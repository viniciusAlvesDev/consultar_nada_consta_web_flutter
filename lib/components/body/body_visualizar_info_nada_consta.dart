import 'package:consultar_nada_consta/components/alerta/alert.dart';
import 'package:consultar_nada_consta/controller/consultar_nada_consta_controller.dart';
import 'package:consultar_nada_consta/controller/gerar_pdf_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  String? identificador = "";

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        double largura = constraint.maxWidth;
        return Consumer2<ConsultarNadaConstaController, GerarPdfNadaConstaController>(builder: (
          context,
          consultarNadaConstaController,
          gerarPdfNadaConstaController,
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
          identificador = consultarNadaConstaController.nadaConstaModel?.unidadeIdentificaor;

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
                                                  identificador!,
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
                      gerarPdfNadaConstaController.carregando
                          ? const Padding(
                              padding: EdgeInsets.all(50.0),
                              child: CircularProgressIndicator(),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await gerarPdfNadaConstaController.refresh(numValidador);

                                      gerarPdfNadaConstaController.pdf != null
                                          ? await FileSaver.instance.saveFile("NadaCosta", gerarPdfNadaConstaController.pdf!, ".pdf", mimeType: MimeType.PDF)
                                          // ignore: use_build_context_synchronously
                                          : alertError(
                                              context,
                                              "Erro ao carregar",
                                              "Não foi possivel carregar o arquivo no momento, tente novamente mais tarde!",
                                              [
                                                Navigator.pop(context),
                                              ],
                                            );
                                    },
                                    child: const Text("Download"),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await gerarPdfNadaConstaController.refresh(numValidador);

                                      gerarPdfNadaConstaController.pdf != null
                                          ? await Printing.layoutPdf(onLayout: (_) => gerarPdfNadaConstaController.pdf!.buffer.asUint8List())
                                          // ignore: use_build_context_synchronously
                                          : alertError(
                                              context,
                                              "Erro ao carregar",
                                              "Não foi possivel carregar o arquivo no momento, tente novamente mais tarde!",
                                              [
                                                Navigator.pop(context),
                                              ],
                                            );
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
}
