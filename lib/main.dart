import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IMCCalculatorPage(),
    );
  }
}

class IMCCalculatorPage extends StatefulWidget {
  @override
  _IMCCalculatorPageState createState() => _IMCCalculatorPageState();
}

class _IMCCalculatorPageState extends State<IMCCalculatorPage> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  String _activeField = 'peso';

  void _onButtonPressed(String value) {
    setState(() {
      if (_activeField == 'peso') {
        _pesoController.text += value;
      } else if (_activeField == 'altura') {
        _alturaController.text += value;
      }
    });
  }

  void _onFieldFocus(String field) {
    setState(() {
      _activeField = field;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Calculadora IMC'),
        backgroundColor: Color(0xff9284ff),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(
              'https://img.freepik.com/vetores-gratis/mulheres-minusculas-perto-de-grafico-obeso-escalas-ilustracao-vetorial-plana-isolada-personagens-femininas-de-desenhos-animados-em-dieta-usando-controle-de-peso-com-imc-indice-de-massa-corporal-e-conceito-de-exercicio-de-aptidao-medica_74855-10177.jpg',
              height: 170,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _pesoController,
              decoration: InputDecoration(
                labelText: 'Peso',
                hintText: 'Digite o Peso',
              ),
              keyboardType: TextInputType.number,
              onTap: () => _onFieldFocus('peso'),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: TextField(
              controller: _alturaController,
              decoration: InputDecoration(
                labelText: 'Altura',
                hintText: 'Digite a Altura',
              ),
              keyboardType: TextInputType.number,
              onTap: () => _onFieldFocus('altura'),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: EdgeInsets.all(16.0),
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              children: [
                for (var i = 1; i <= 9; i++)
                  ElevatedButton(
                    onPressed: () => _onButtonPressed('$i'),
                    child: Text('$i'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(24),
                      textStyle: TextStyle(fontSize: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('.'),
                  child: Text('.'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(24),
                    textStyle: TextStyle(fontSize: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('0'),
                  child: Text('0'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(24),
                    textStyle: TextStyle(fontSize: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('↲'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(24),
                    textStyle: TextStyle(fontSize: 24),
                    backgroundColor: Color(0xffffdcb4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
