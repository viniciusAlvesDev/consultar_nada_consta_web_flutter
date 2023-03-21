import 'package:consultar_nada_consta/components/body/body_visualizar_info_nada_consta.dart';
import 'package:consultar_nada_consta/controller/consultar_nada_consta_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/footer/footer.dart';
import '../components/headers/headerMobile.dart';
import '../components/headers/headerWeb.dart';

class VisualizarInfoNadaConsta extends StatefulWidget {
  const VisualizarInfoNadaConsta({
    super.key,
  });

  @override
  State<VisualizarInfoNadaConsta> createState() => _VisualizarInfoNadaConstaState();
}

class _VisualizarInfoNadaConstaState extends State<VisualizarInfoNadaConsta> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      var largura = constraint.maxWidth;
      var altura = MediaQuery.of(context).size.height;
      var alturaBarraStatus = MediaQuery.of(context).padding.top;
      var alturaAppBar = AppBar().preferredSize.height;

      return Consumer<ConsultarNadaConstaController>(builder: (
        context,
        consultarNadaConstaController,
        child,
      ) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: PreferredSize(
              preferredSize: Size(largura, 100),
              child: largura < 715 ? const HeaderMobile() : const HeaderWeb(),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  largura < 760
                      ? SingleChildScrollView(
                          child: Column(
                            children: const [
                              BodyVisualizarInfoNadaConsta(),
                            ],
                          ),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(children: [
                                SizedBox(
                                  height: altura - alturaAppBar - alturaBarraStatus,
                                  width: largura,
                                  child: const BodyVisualizarInfoNadaConsta(),
                                )
                              ])
                            ],
                          ),
                        ),
                ],
              ),
            ),
            bottomNavigationBar: const Footer(),
          ),
        );
      });
    });
  }
}
