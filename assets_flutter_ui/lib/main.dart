import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notitas UWU',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Notitas UWU Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String textFromFile = 'Ingresa una nota para que me llenes de amor c:';
  TextEditingController _controller = TextEditingController();

  getData() async {
    String response = await rootBundle.loadString('archivos_texto/mis_apuntes.txt');
    setState(() {
      textFromFile = response;
      _controller.text = textFromFile; // Establecemos el contenido del archivo en el controlador
    });
  }

  clear() {
    setState(() {
      textFromFile = 'Vacio';
      _controller.clear(); // Limpiamos el controlador
    });
  }

  saveNote() {
    setState(() {
      textFromFile = _controller.text; // Guardamos el contenido editado en textFromFile
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color.fromARGB(255, 248, 241, 245),
        elevation: 4.0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Contenedor con texto editable
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _controller, // Controlador para editar el texto
                  maxLines: 5, // Permite varias líneas
                  decoration: InputDecoration(
                    hintText: 'Escribe tu nota aquí...',
                    border: InputBorder.none,
                  ),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 20),
              // Botón de Importar Notitas
              ElevatedButton.icon(
                onPressed: () {
                  getData();
                },
                icon: const Icon(Icons.import_export),
                label: const Text('Importar Notitas'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Botón de Guardar cambios
              ElevatedButton.icon(
                onPressed: () {
                  saveNote();
                },
                icon: const Icon(Icons.save),
                label: const Text('Guardar Nota'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Botón de Borrar
              ElevatedButton.icon(
                onPressed: () {
                  clear();
                },
                icon: const Icon(Icons.clear),
                label: const Text('Borrar'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[100], // Fondo de la pantalla principal
    );
  }
}
