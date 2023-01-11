import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderMobile extends StatefulWidget {
  const HeaderMobile({Key? key}) : super(key: key);

  @override
  State<HeaderMobile> createState() => _HeaderMobileState();
}

class _HeaderMobileState extends State<HeaderMobile> {
  final Uri quemSomos = Uri.parse('https://pactonet.com.br/quem-somos/');
  final Uri servicos = Uri.parse('https://pactonet.com.br/servicos/');
  final Uri diferenciais = Uri.parse('https://pactonet.com.br/diferenciais/');
  final Uri blog = Uri.parse('https://pactonet.com.br/blog/');
  final Uri ajuda = Uri.parse('https://pactonet.com.br/ajuda/');
  final Uri contato = Uri.parse('https://pactonet.com.br/contato/');

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Image.asset(
          "images/logo-pacto.png",
          height: 50,
        ),
      ),
      toolbarHeight: 90,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.indigo[900]),
              textTheme: const TextTheme().apply(bodyColor: Colors.white),
            ),
            child: PopupMenuButton<int>(
              color: Colors.indigo[900],
              onSelected: (item) => onMenu(context, item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  onTap: urlQuemSomos,
                  child: const InkWell(
                    child: Text(
                      "QUEM SOMOS",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem<int>(
                  onTap: urlServicos,
                  child: const InkWell(
                    child: Text(
                      "SERVIÇOS",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem<int>(
                  onTap: urlDiferenciais,
                  child: const InkWell(
                    child: Text(
                      "DIFERENCIAIS",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem<int>(
                  onTap: urlBlog,
                  child: const InkWell(
                    child: Text(
                      "BLOG",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem<int>(
                  onTap: urlAjuda,
                  child: const InkWell(
                    child: Text(
                      "AJUDA",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem<int>(
                  onTap: urlContato,
                  child: const InkWell(
                    child: Text(
                      "CONTATO",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  urlQuemSomos() async {
    if (!await launchUrl(quemSomos)) throw 'Não foi possível acessar $quemSomos';
  }

  urlServicos() async {
    if (!await launchUrl(servicos)) throw 'Não foi possível acessar $servicos';
  }

  urlDiferenciais() async {
    if (!await launchUrl(diferenciais)) {
      throw 'Não foi possível acessar $diferenciais';
    }
  }

  urlBlog() async {
    if (!await launchUrl(blog)) throw 'Não foi possível acessar $blog';
  }

  urlAjuda() async {
    if (!await launchUrl(ajuda)) throw 'Não foi possível acessar $ajuda';
  }

  urlContato() async {
    if (!await launchUrl(contato)) throw 'Não foi possível acessar $contato';
  }

  onMenu(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).pushReplacementNamed('/filtrar-ordem-pagamento');
        break;
    }
  }
}
