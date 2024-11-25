import 'dart:async';
// Importa la biblioteca de Dart que incluye temporizadores y utilidades asincrónicas.

import 'package:flutter/material.dart';
// Importa el paquete principal de Flutter para construir la interfaz de usuario.

import 'package:google_fonts/google_fonts.dart';
// Importa el paquete para usar fuentes personalizadas de Google Fonts.

import 'package:super_mario/button.dart';
import 'package:super_mario/jumpingmario.dart';
import 'package:super_mario/mario.dart';
import 'package:super_mario/shrooms.dart';
// Importa clases personalizadas desde archivos locales para componentes como botones, Mario en salto,
// Mario estándar y hongos ("shrooms").

class HomePage extends StatefulWidget {
  // Define una página principal como un widget con estado.
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variables iniciales y configuración para el estado del juego.

  static double marioX = 0;
  // Posición inicial de Mario en el eje X (horizontal).

  static double marioY = 1;
  // Posición inicial de Mario en el eje Y (vertical).

  double marioSize = 50;
  // Tamaño inicial de Mario.

  double shroomX = 0.5;
  // Posición inicial del hongo en el eje X.

  double shroomY = 1;
  // Posición inicial del hongo en el eje Y.

  double time = 0;
  // Variable para el tiempo transcurrido en el salto.

  double height = 0;
  // Altura alcanzada durante el salto.

  double initialHeight = marioY;
  // Altura inicial antes del salto.

  String direction = "right";
  // Dirección inicial de Mario ("right" o "left").

  bool midrun = false;
  // Indica si Mario está corriendo.

  bool midjump = false;
  // Indica si Mario está en medio de un salto.

  var gameFont = GoogleFonts.pressStart2p(
      // Estilo de fuente personalizada para los textos del juego.
      textStyle: TextStyle(color: Colors.white, fontSize: 20));

  void checkIfAteShrooms() {
    // Verifica si Mario ha comido un hongo.
    if ((marioX - shroomX).abs() < 0.05 && (marioY - shroomY).abs() < 0.05) {
      setState(() {
        // Si el hongo fue comido, lo mueve fuera de la pantalla y agranda a Mario.
        shroomX = 2; // Mueve el hongo fuera de la pantalla.
        marioSize = 100; // Aumenta el tamaño de Mario.
      });
    }
  }

  void preJump() {
    // Configura las variables antes de un salto.
    time = 0;
    initialHeight = marioY;
  }

  void jump() {
    // Controla el salto de Mario.
    if (midjump == false) {
      // Impide un salto doble.
      midjump = true;
      preJump();
      Timer.periodic(Duration(milliseconds: 100), (timer) {
        // Temporizador para calcular la posición de Mario durante el salto.
        time += 0.5;
        height = -3 * time * time + 4 * time;
        // Fórmula para simular el movimiento parabólico del salto.

        if (initialHeight - height > 1) {
          // Si Mario ha aterrizado:
          midjump = false;
          setState(() {
            marioY = 1;
          });
          timer.cancel();
          // Detiene el temporizador.
        } else {
          setState(() {
            marioY = initialHeight - height;
            // Ajusta la posición de Mario en el eje Y según la fórmula.
          });
        }
      });
    }
  }

  void moveRight() {
    // Mueve a Mario hacia la derecha.
    direction = "right";
    checkIfAteShrooms();
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      // Temporizador para movimiento continuo.
      checkIfAteShrooms();
      if (MyButton().userIsHoldingButton() == true && (marioX + 0.02) < 1) {
        // Si el usuario sigue presionando el botón y no se excede el límite derecho:
        setState(() {
          marioX += 0.02; // Incrementa la posición en X.
          midrun = !midrun; // Alterna el estado de carrera para la animación.
        });
      } else {
        timer.cancel();
        // Detiene el movimiento si el botón no se presiona o Mario alcanza el borde.
      }
    });
  }

  void moveLeft() {
    // Mueve a Mario hacia la izquierda.
    direction = "left";
    checkIfAteShrooms();
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      checkIfAteShrooms();
      if (MyButton().userIsHoldingButton() == true && (marioX - 0.02) > -1) {
        setState(() {
          marioX -= 0.02; // Reduce la posición en X.
          midrun = !midrun; // Alterna el estado de carrera.
        });
      } else {
        timer.cancel();
        // Detiene el movimiento si el botón no se presiona o Mario alcanza el borde izquierdo.
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Construye la interfaz del juego.
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            flex: 4, // La parte superior ocupa 4/5 del espacio vertical.
            child: Stack(
              children: [
                Container(
                  color: Colors.blue,
                  // Fondo azul para representar el cielo.
                  child: AnimatedContainer(
                    alignment: Alignment(marioX, marioY),
                    // Posición de Mario según sus coordenadas.
                    duration: Duration(milliseconds: 0),
                    child: midjump
                        ? JumpingMario(
                            // Muestra a Mario en modo de salto.
                            direction: direction,
                            size: marioSize,
                          )
                        : MyMario(
                            // Muestra a Mario en estado normal.
                            direction: direction,
                            midrun: midrun,
                            size: marioSize,
                          ),
                  ),
                ),
                Container(
                  alignment: Alignment(shroomX, shroomY),
                  // Posición del hongo.
                  child: MyShroom(),
                  // Widget personalizado para representar el hongo.
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text("MARIO", style: gameFont),
                          // Texto "MARIO" con estilo personalizado.
                          SizedBox(height: 10),
                          Text("0000", style: gameFont),
                          // Puntaje inicial.
                        ],
                      ),
                      Column(
                        children: [
                          Text("WORLD", style: gameFont),
                          SizedBox(height: 10),
                          Text("1-1", style: gameFont),
                          // Nivel inicial.
                        ],
                      ),
                      Column(
                        children: [
                          Text("TIME", style: gameFont),
                          SizedBox(height: 10),
                          Text("9999", style: gameFont),
                          // Tiempo restante (simulado).
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )),
        Expanded(
            flex: 1, // La parte inferior ocupa 1/5 del espacio vertical.
            child: Container(
                color: Colors.brown,
                // Fondo marrón para representar el suelo.
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(
                      // Botón personalizado para mover a la izquierda.
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      function: moveLeft,
                      // Asigna la función moveLeft.
                    ),
                    MyButton(
                      // Botón para saltar.
                      child: Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                      ),
                      function: jump,
                      // Asigna la función jump.
                    ),
                    MyButton(
                      // Botón para mover a la derecha.
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      function: moveRight,
                      // Asigna la función moveRight.
                    ),
                  ],
                ))),
      ],
    ));
  }
}
