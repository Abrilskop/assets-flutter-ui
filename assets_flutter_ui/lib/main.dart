import 'package:flutter/material.dart'; // Importa el paquete principal de Flutter para construir interfaces de usuario.
import 'package:flutter/services.dart' show rootBundle; // Importa rootBundle para poder acceder a archivos locales.

void main() {
  runApp(const MyApp()); // Llama a la función runApp para ejecutar la aplicación. Carga el widget MyApp como la raíz de la app.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor de la clase MyApp, que es un widget sin estado.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notitas UWU', // Define el título de la aplicación, que se muestra en el sistema operativo.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // Define el esquema de colores basado en un color semilla (purple en este caso).
        useMaterial3: true, // Usa el diseño de Material 3.
      ),
      home: const MyHomePage(title: 'Notitas UWU Home Page'), // La pantalla inicial es MyHomePage.
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title}); // Constructor de MyHomePage, que recibe un título como parámetro.
  final String title; // Almacena el título que se pasa como argumento.

  @override
  State<MyHomePage> createState() => _MyHomePageState(); // Crea el estado asociado a MyHomePage.
}

class _MyHomePageState extends State<MyHomePage> {
  String textFromFile = 'Vacio'; // Inicializa la variable que guardará el texto que se obtendrá del archivo.

  getData() async {
    // Función que lee un archivo de texto de manera asíncrona.
    String response;
    response = await rootBundle.loadString('archivos_texto/mis_apuntes.txt'); // Lee el archivo "mis_apuntes.txt" desde los recursos locales.
    setState(() {
      textFromFile = response; // Actualiza el estado con el contenido del archivo.
    });
  }

  clear() {
    // Función que limpia el texto en pantalla.
    setState(() {
      textFromFile = 'Vacio'; // Restablece el texto a 'Vacio'.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido en el eje vertical.
          children: [
            Text(
              textFromFile, // Muestra el contenido del archivo o 'Vacio' si no se ha cargado ningún texto.
              style: Theme.of(context).textTheme.headlineMedium, // Aplica el estilo de texto según el tema de la app.
            ),
            ElevatedButton(
              onPressed: () {
                getData(); // Cuando el botón es presionado, llama a getData para cargar el archivo de texto.
              },
              child: const Text('Importar Notitas'), // Texto del primer botón.
            ),
            ElevatedButton(
              onPressed: () {
                clear(); // Cuando el botón es presionado, llama a clear para limpiar el texto.
              },
              child: const Text('Clear'), // Texto del segundo botón.
            ),
          ],
        ),
      ),
    );
  }
}
