// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderWeb extends StatefulWidget {
  const HeaderWeb({Key? key}) : super(key: key);

  @override
  State<HeaderWeb> createState() => _HeaderWebState();
}

class _HeaderWebState extends State<HeaderWeb> {
  final Uri home = Uri.parse('https://pactonet.com.br/');
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
      title: InkWell(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Image.asset(
            "images/logo-pacto.png",
            height: 50,
          ),
        ),
        onTap: () {
           urlHome;
        },
      ),
      toolbarHeight: 90,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Row(
            children: [
              TextButton(
                style: const ButtonStyle(),
                onPressed: urlQuemSomos,
                child: const Text(
                  'QUEM SOMOS',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextButton(
                style: const ButtonStyle(),
                onPressed: urlServicos,
                child: const Text(
                  'SERVIÇOS',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextButton(
                style: const ButtonStyle(),
                onPressed: urlDiferenciais,
                child: const Text(
                  'DIFERENCIAIS',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextButton(
                style: const ButtonStyle(),
                onPressed: urlBlog,
                child: const Text(
                  'BLOG',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextButton(
                style: const ButtonStyle(),
                onPressed: urlAjuda,
                child: const Text(
                  'AJUDA',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextButton(
                style: const ButtonStyle(),
                onPressed: urlContato,
                child: const Text(
                  'CONTATO',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  urlHome() async {
    if (!await launchUrl(home)) {
      throw 'Não foi possível acessar $home';
    }
  }

  urlQuemSomos() async {
    if (!await launchUrl(quemSomos)) {
      throw 'Não foi possível acessar $quemSomos';
    }
  }

  urlServicos() async {
    if (!await launchUrl(servicos)) {
      throw 'Não foi possível acessar $servicos';
    }
  }

  urlDiferenciais() async {
    if (!await launchUrl(diferenciais)) {
      throw 'Não foi possível acessar $diferenciais';
    }
  }

  urlBlog() async {
    if (!await launchUrl(blog)) {
      throw 'Não foi possível acessar $blog';
    }
  }

  urlAjuda() async {
    if (!await launchUrl(ajuda)) {
      throw 'Não foi possível acessar $ajuda';
    }
  }

  urlContato() async {
    if (!await launchUrl(contato)) {
      throw 'Não foi possível acessar $contato';
    }
  }
}
