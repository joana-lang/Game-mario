import 'package:flutter/material.dart';
// Importa el paquete principal de Flutter para construir aplicaciones de interfaz de usuario.

import 'package:super_mario/homepage.dart';
// Importa el archivo `homepage.dart`, que contiene la pantalla principal de la aplicación.

void main() {
  // Función principal que se ejecuta al iniciar la aplicación.
  runApp(MyApp());
  // Llama a `runApp` para lanzar la aplicación y mostrar el widget raíz, que en este caso es `MyApp`.
}

class MyApp extends StatelessWidget {
  // Define la clase `MyApp`, que extiende `StatelessWidget`.
  // Esta clase representa la raíz de la aplicación y es inmutable.

  @override
  Widget build(BuildContext context) {
    // Sobrescribe el método `build` para construir la interfaz del widget raíz.
    return MaterialApp(
      // Crea un widget `MaterialApp`, que es la base de una aplicación Flutter con diseño Material.

      debugShowCheckedModeBanner: false,
      // Oculta el banner de depuración que aparece en la esquina superior derecha de la aplicación.

      home: HomePage(),
      // Establece `HomePage` como la pantalla inicial de la aplicación.
    );
  }
}
//
