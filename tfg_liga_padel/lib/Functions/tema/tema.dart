

import 'package:flutter/material.dart';

/// Clase que carga el tema de la aplicación
/// Permite alternar entre tema claro y oscuro
/// Si en el constructor se le pasa un 0 carga el tema claro
/// Si en el constructor se le pasa un 1 carga el tema oscuro
/// Si en el constructor se le pasa cualquier otro valor carga el tema claro
class CargadorTema with ChangeNotifier {
  
  late ThemeData _tema; 

  bool _temaOscuro = false;

  bool get temaOscuro => this._temaOscuro;
  ThemeData get temaActual => _tema;
  
  CargadorTema(int tema) {
    //fijamos el tema activo
    switch (tema) {
      case 0:
        _tema = _miTemaClaro();
        _temaOscuro = false;
        break;
      case 1:
      //modificamos valores del tema oscuro para nuestra app
        _tema = _miTemaOscuro();
        _temaOscuro = true;
        break;
      default:
        _tema =  _miTemaClaro();
        break;
    }
  }

  get colorScheme => null;
  
  set temaOscuro(bool value) {
    _temaOscuro = value;
    //fijamos el tema activo
    if (value) {
      //modificamos valores del tema oscuro para nuestra app
      _tema = _miTemaOscuro();
    } else {
      _tema = _miTemaClaro();
    }
    notifyListeners();
  }

  set temaClaro(bool value) {
    _temaOscuro = !value;
    //fijamos el tema activo
    if (value) {
      _tema = _miTemaClaro();
    } else {
      _tema = _miTemaOscuro();
    }
    notifyListeners();
  }

  ThemeData _miTemaClaro(){
    return (ThemeData.light().copyWith(
          colorScheme: const ColorScheme(
            primary: Color.fromARGB(255, 227, 234, 239), // Azul primario
            secondary: Color.fromARGB(255, 29, 87, 129), // Color secundario
            background: Color.fromARGB(255, 227, 234, 239), // Color de fondo
            onBackground: Colors.black, // Color del texto sobre el fondo
            surface: Color.fromARGB(255, 87, 129, 29), // Color de la superficie
            onPrimary: Colors.black, // Color del texto sobre el color primario
            onSecondary: Color.fromARGB(255, 227, 234, 239), // Color del texto sobre el color secundario
            onSurface: Colors.black, // Color del texto sobre la superficie
            brightness: Brightness.light, // Brillo del tema claro
            error: Color(0xFFFF6E40),
            onError: Color(0xFFECEFF1),
            tertiary: Color.fromARGB(255,199, 213, 224),
            onTertiary: Color.fromARGB(255, 29, 87, 129),
          ),
        )
      );
  }
  ThemeData _miTemaOscuro(){
    return (ThemeData.dark().copyWith(
        colorScheme: const ColorScheme(
          primary: Color.fromARGB(255, 29, 87, 129), // Azul primario para el tema oscuro
          secondary: Color.fromARGB(255, 129, 29, 87), // Color secundario para el tema oscuro
          background: Color(0xFF121212), // Color de fondo para el tema oscuro
          surface: Color.fromARGB(255, 172, 196, 139), // Color de la superficie para el tema oscuro
          onPrimary: Colors.white, // Color del texto sobre el color primario en el tema oscuro
          onSecondary: Colors.white, // Color del texto sobre el color secundario en el tema oscuro
          onBackground: Colors.white, // Color del texto sobre el fondo en el tema oscuro
          onSurface: Colors.white, // Color del texto sobre la superficie en el tema oscuro
          brightness: Brightness.dark,  // Brillo del tema oscuro 
          error: Color(0xFFFF5252), 
          onError: Color(0xFF212121),
          tertiary: Color.fromARGB(255, 91, 112, 128),
          onTertiary:Colors.white,
        ),
      )
    );
  }

}