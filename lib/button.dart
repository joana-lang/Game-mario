import 'package:flutter/material.dart';
// Importa el paquete principal de Flutter para construir interfaces de usuario.

class MyButton extends StatelessWidget {
  // Declara una clase llamada `MyButton` que extiende `StatelessWidget`.
  // Representa un botón personalizado que responde a gestos táctiles.

  final child;
  // Una propiedad que define el contenido visual del botón, como un ícono o un texto.

  final function;
  // Una propiedad que recibe la función que se ejecutará cuando el botón sea presionado.

  static bool holdingButton = false;
  // Una propiedad estática para rastrear si el botón está siendo presionado de manera continua.

  MyButton({this.child, this.function});
  // Constructor que permite inicializar las propiedades `child` y `function`.

  bool userIsHoldingButton() {
    // Método que devuelve el estado actual de `holdingButton`.
    return holdingButton;
  }

  @override
  Widget build(BuildContext context) {
    // Sobrescribe el método `build` para construir la interfaz de este widget.

    return GestureDetector(
      // `GestureDetector` permite detectar gestos táctiles, como toques y deslizamientos.

      onTapDown: (details) {
        // `onTapDown` se activa cuando el usuario presiona el botón.
        holdingButton = true;
        // Cambia `holdingButton` a `true`, indicando que el botón está siendo presionado.

        function();
        // Llama a la función asociada al botón para ejecutar la acción correspondiente.
      },

      onTapUp: (details) {
        // `onTapUp` se activa cuando el usuario deja de presionar el botón.
        holdingButton = false;
        // Cambia `holdingButton` a `false`, indicando que el botón ha dejado de ser presionado.
      },

      child: ClipRRect(
        // `ClipRRect` aplica esquinas redondeadas al contenido del botón.
        borderRadius: BorderRadius.circular(15),
        // Define el radio de las esquinas redondeadas en 15 píxeles.

        child: Container(
          // El contenedor define el tamaño, el color y el relleno del botón.
          padding: EdgeInsets.all(10),
          // Agrega un margen interior de 10 píxeles alrededor del contenido del botón.

          color: Colors.brown[300],
          // Establece el color de fondo del botón con un tono marrón claro.

          child: child,
          // Muestra el contenido del botón, que puede ser un texto o un ícono pasado como argumento.
        ),
      ),
    );
  }
}
