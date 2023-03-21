import 'package:consultar_nada_consta/controller/consultar_nada_consta_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 10), () {
      var nadaConsta = context.read<ConsultarNadaConstaController>().nadaConstaModel!.numero;
      nadaConsta == null ? Navigator.of(context).pushReplacementNamed('/consultar-nada-consta') : Navigator.of(context).pushReplacementNamed('/visualizar-info-nada-consta');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[900],
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
