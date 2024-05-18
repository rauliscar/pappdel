import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:tfg_liga_padel/Functions/bottom_bar.dart';
import 'package:tfg_liga_padel/Screens/home.dart';
import 'package:provider/provider.dart';
import 'package:tfg_liga_padel/Screens/info_equipo.dart';
import 'package:tfg_liga_padel/tema/tema.dart';

void main() {
  runApp(
    //Cargamos en el nivel más alto de la aplicación el provider
    //En dicho provider cargamos el tema actual
    MultiProvider(
      providers: [
          ChangeNotifierProvider(
          //cargamos el tema claro por defecto
          create: (_) => CargadorTema(0)),
          //ChangeNotifierProvider(
          //cargamos el modo de funcionamiento por defecto
          //create: (_) => ModoTrabajo()), 
      ],
      child: const MainApp(),
      ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        //"/": (context) => BottomNavigationBarExampleApp(0),
        "/": (context) => const HomePage(),
      },
      theme: ThemeData(
        //textTheme: GoogleFonts.robotoTextTheme(),
        //textTheme: GoogleFonts.poppinsTextTheme(),
        textTheme: GoogleFonts.nunitoSansTextTheme(),
      ),
    );
  }
}
