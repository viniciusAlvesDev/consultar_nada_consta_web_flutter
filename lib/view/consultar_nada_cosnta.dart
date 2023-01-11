import 'package:consultar_nada_consta/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ConsultarNadaConsta extends StatefulWidget {
  const ConsultarNadaConsta({super.key});

  @override
  State<ConsultarNadaConsta> createState() => _ConsultarNadaConstaState();
}

class _ConsultarNadaConstaState extends State<ConsultarNadaConsta> {
  final loading = ValueNotifier<bool>(false);
  final ctrlNumValidador = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var maskValidador = MaskTextInputFormatter(mask: '#####.#####.#####');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          var largura = constraint.maxWidth;
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "images/background.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Container(
                width: largura < 550 ? 350 : 500,
                height: 550,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                padding: const EdgeInsets.all(40),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "images/logo-pacto.png",
                              width: 120,
                              height: 120,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(padding: EdgeInsets.all(10)),
                            Text(
                              "Validar Nada Consta",
                              style: TextStyle(color: Colors.indigo[900], fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const Padding(padding: EdgeInsets.all(20)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          children: const [
                            Padding(padding: EdgeInsets.all(10)),
                            Text(
                              'Digite o Nº do validador no campo abaixo e clique no botão "Validar".',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: ctrlNumValidador,
                          obscureText: false,
                          inputFormatters: [maskValidador],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Número Validador",
                            hintText: "Informe o número validador",
                          ),
                          validator: (String? value) {
                            if (ctrlNumValidador.text.isEmpty) {
                              return "Favor informar um valor valido";
                            }
                            if (ctrlNumValidador.text.length < 15) {
                              return "O número validador deve conter 15 caracteres";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                minimumSize: MaterialStateProperty.all(
                                  const Size(200.0, 45.0),
                                ),
                              ),
                              child: AnimatedBuilder(
                                animation: loading,
                                builder: (context, _) {
                                  return loading.value
                                      ? const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        )
                                      : const Text(
                                          "Validar",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        );
                                },
                              ),
                              onPressed: () {
                                bool formok = _formKey.currentState!.validate();

                                if (!formok) {
                                  loading.value = false;

                                  return;
                                }
                                if (formok) {
                                  Navigator.pushNamed(context, Routes.VISUALIZAR_INFO_NADA_CONSTA);
                                }
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
