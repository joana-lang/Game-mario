import 'dart:math';
// Importa la biblioteca matemática de Dart, que incluye constantes y funciones como `pi` para cálculos geométricos.

import 'package:flutter/material.dart';
// Importa el paquete principal de Flutter para construir interfaces de usuario.

class JumpingMario extends StatelessWidget {
  // Declara una clase llamada `JumpingMario` que extiende `StatelessWidget`.
  // Este widget es inmutable y se usa para representar a Mario mientras está saltando.

  final direction;
  // Variable que indica la dirección en la que Mario está mirando (por ejemplo, "right" o "left").

  final size;
  // Variable que representa el tamaño de Mario (ancho y alto del widget).

  JumpingMario({this.direction, this.size});
  // Constructor que permite inicializar las propiedades `direction` y `size` al crear una instancia del widget.

  @override
  Widget build(BuildContext context) {
    // Sobrescribe el método `build` para definir cómo se verá este widget en la pantalla.

    if (direction == "right") {
      // Si la dirección de Mario es "right" (derecha):
      return Container(
        width: size,
        // Establece el ancho del contenedor igual al valor de `size`.

        height: size,
        // Establece la altura del contenedor igual al valor de `size`.

        child: Image.asset('lib/images/jumpin.png'),
        // Carga y muestra la imagen de Mario saltando (`jumpin.png`) desde la carpeta `lib/images/`.
      );
    } else {
      // Si la dirección de Mario no es "right" (se asume que es "left"):
      return Transform(
        alignment: Alignment.center,
        // Configura el punto de referencia para la transformación en el centro del widget.

        transform: Matrix4.rotationY(pi),
        // Aplica una rotación de 180° en el eje Y (pi radianes) para invertir la imagen horizontalmente.

        child: Container(
          width: size,
          // Establece el ancho del contenedor igual al valor de `size`.

          height: size,
          // Establece la altura del contenedor igual al valor de `size`.

          child: Image.asset('lib/images/jumpin.png'),
          // Carga y muestra la misma imagen de Mario saltando (`jumpin.png`), pero invertida horizontalmente.
        ),
      );
    }
  }
}
