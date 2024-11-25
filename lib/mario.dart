import 'dart:math';
// Importa la biblioteca matemática de Dart, que incluye constantes y funciones como pi (para rotaciones).

import 'package:flutter/material.dart';
// Importa el paquete principal de Flutter para construir la interfaz de usuario.

class MyMario extends StatelessWidget {
  // Define una clase personalizada llamada MyMario que extiende StatelessWidget,
  // lo que significa que su estado no cambiará después de ser construido.

  final direction;
  // Variable que indica la dirección del personaje ("right" o cualquier otra cosa para "left").

  final midrun;
  // Variable que indica si Mario está corriendo (midrun = false) o parado (midrun = true).

  final size;
  // Variable que define el tamaño del personaje (tanto ancho como alto).

  MyMario({this.direction, this.midrun, this.size});
  // Constructor para inicializar las variables 'direction', 'midrun' y 'size' al crear una instancia de MyMario.

  @override
  Widget build(BuildContext context) {
    // Método 'build' que describe cómo construir el widget en la pantalla.

    if (direction == "right") {
      // Verifica si la dirección es "right" (Mario mirando hacia la derecha).

      return Container(
        width: size,
        // Define el ancho del contenedor como el valor de 'size'.

        height: size,
        // Define la altura del contenedor igual al ancho (un cuadrado de tamaño 'size').

        child: midrun
            ? Image.asset('lib/images/standing.png')
            // Si 'midrun' es verdadero, muestra la imagen "standing.png" (Mario parado).
            : Image.asset('lib/images/runing.png'),
        // Si 'midrun' es falso, muestra la imagen "runing.png" (Mario corriendo).
      );
    } else {
      // Si la dirección no es "right", Mario mira hacia la izquierda.

      return Transform(
        alignment: Alignment.center,
        // Configura el punto de anclaje para la transformación como el centro del widget.

        transform: Matrix4.rotationY(pi),
        // Aplica una rotación en el eje Y de 180° (pi radianes) para invertir la imagen horizontalmente.

        child: Container(
          width: size,
          // Define el ancho del contenedor.

          height: size,
          // Define la altura del contenedor igual al ancho.

          child: midrun
              ? Image.asset('lib/images/standing.png')
              // Si 'midrun' es verdadero, muestra la imagen "standing.png" invertida horizontalmente.
              : Image.asset('lib/images/runing.png'),
          // Si 'midrun' es falso, muestra la imagen "runing.png" invertida horizontalmente.
        ),
      );
    }
  }
}
