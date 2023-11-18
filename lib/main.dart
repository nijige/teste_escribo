import 'package:flutter/material.dart';
import 'logica.dart'; // Importando o arquivo com a lógica

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Somatório de Múltiplos de 3 ou 5'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Insira um número:',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              _SomatorioWidget(), // Novo widget para exibição do somatório
            ],
          ),
        ),
      ),
    );
  }
}

class _SomatorioWidget extends StatefulWidget {
  @override
  _SomatorioWidgetState createState() => _SomatorioWidgetState();
}

class _SomatorioWidgetState extends State<_SomatorioWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Número',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            final numero = int.tryParse(_controller.text) ?? 0;
            final resultado = somatorioDivisiveis3ou5(numero);
            _mostrarResultado(context, resultado);
          },
          child: const Text('Calcular Somatório'),
        ),
      ],
    );
  }

  void _mostrarResultado(BuildContext context, int resultado) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Resultado'),
          content: Text('Somatório: $resultado'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
