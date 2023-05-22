import 'package:flutter/material.dart';
import '../controllers/CustomDrawer.dart';
import 'Square.dart';
import 'TelaPrincipal.dart';

class Filtrar extends StatefulWidget {
  const Filtrar({super.key});

  // * TITULO STACK
  return_TituloStack(String tituloStack) {
    return Column(
      children: <Widget>[
        Text(tituloStack,
            style: const TextStyle(
                fontSize: 40,
                color: Color(0xFFD9D9D9),
                fontWeight: FontWeight.bold)),
      ],
    );
  }

  // * SUBTITULO
  return_Subtitulo(String subtitulo) {
    return Container(
      padding: const EdgeInsets.only(left: 22),
      alignment: Alignment.centerLeft,
      child: Text(subtitulo,
          style: const TextStyle(
              fontSize: 20,
              color: Color(0xFFD9D9D9),
              fontWeight: FontWeight.bold)),
    );
  }

  @override
  State<Filtrar> createState() => _FiltrarState();
}

class _FiltrarState extends State<Filtrar> {
  List<String> escolhas = [];
  String tecnolog_Var = 'Angular';
  String entrev_Var = 'Sem Codigo';
  String nivel_Var = 'Junior';

  List<String> entrevista = ['Sem Codigo', 'Com Codigo'];
  List<String> nivel = ['Junior', 'Pleno', 'Senior'];
  List<String> tecnologias = ['HTML', 'CSS', 'JavaScript', 'Angular'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: TelaPrincipal().return_AppBar(),
      endDrawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 18),
            TelaPrincipal().return_Anuncio(),
            const SizedBox(height: 20),
            const Filtrar().return_TituloStack('FRONT END'),
            const SizedBox(height: 20),
            const Filtrar().return_Subtitulo("Tipo de Entrevista"),
            const SizedBox(height: 18),
            Wrap(
              children: entrevista
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InputChip(
                        label: Text(item),
                        selected: item == entrev_Var,
                        selectedColor: Colors.amber.withOpacity(0.5),
                        pressElevation: 5,
                        onPressed: () {
                          setState(() {
                            entrev_Var = item;
                          });
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 18),
            const Filtrar().return_Subtitulo("Nível"),
            const SizedBox(height: 18),
            Wrap(
              children: nivel
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InputChip(
                        label: Text(item),
                        selected: item == nivel_Var,
                        selectedColor: Colors.amber.withOpacity(0.5),
                        pressElevation: 5,
                        onPressed: () {
                          setState(() {
                            nivel_Var = item;
                          });
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 18),
            const Filtrar().return_Subtitulo("Tecnologias"),
            const SizedBox(height: 18),
            Wrap(
              children: tecnologias
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InputChip(
                        label: Text(item),
                        selected: item == tecnolog_Var,
                        selectedColor: Colors.amber.withOpacity(0.5),
                        pressElevation: 5,
                        onPressed: () {
                          setState(() {
                            tecnolog_Var = item;
                          });
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(width: 28),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ActionChip(
                //avatar: Icon(Icons.send_and_archive_sharp),
                shadowColor: Colors.amber.withOpacity(0.5),
                label: const Text(
                  "Aplicar",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                pressElevation: 7,
                onPressed: () {
                  escolhas.clear();
                  escolhas.add('FRONTEND');
                  escolhas.add(tecnolog_Var.toUpperCase());
                  escolhas.add(entrev_Var.toUpperCase());
                  escolhas.add(nivel_Var.toUpperCase());

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Square(linguagemList: escolhas),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}