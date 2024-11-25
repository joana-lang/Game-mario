import 'package:flutter/material.dart';
// Importa el paquete principal de Flutter para construir interfaces de usuario.

class MyShroom extends StatelessWidget {
  // Declara una clase llamada `MyShroom` que extiende `StatelessWidget`.
  // Esto significa que este widget es inmutable y no tendrá estado dinámico.

  @override
  Widget build(BuildContext context) {
    // Sobrescribe el método `build` para definir cómo se verá este widget en la pantalla.
    return Container(
      // Crea un contenedor que envolverá el contenido del hongo.
      height: 35,
      // Establece la altura del contenedor en 35 píxeles.

      width: 35,
      // Establece el ancho del contenedor en 35 píxeles (cuadrado).

      child: Image.asset('lib/images/hongo.png'),
      // Muestra una imagen que se carga desde el directorio local del proyecto (`lib/images/hongo.png`).
    );
  }
}
