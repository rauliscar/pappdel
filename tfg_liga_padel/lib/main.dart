import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tfg_liga_padel/Functions/bottom_bar.dart';
//import 'package:tfg_liga_padel/Functions/bottom_bar.dart';
import 'package:tfg_liga_padel/Screens/dashboard.dart';
import 'package:provider/provider.dart';
import 'package:tfg_liga_padel/Screens/dashboard_sin_equipo.dart';
import 'package:tfg_liga_padel/Screens/info_enfrentamiento.dart';
import 'package:tfg_liga_padel/Screens/info_jugador.dart';
import 'package:tfg_liga_padel/Screens/login.dart';
import 'package:tfg_liga_padel/Screens/perfilUsuario.dart';
import 'package:tfg_liga_padel/Screens/signup.dart';
import 'package:tfg_liga_padel/Screens/info_equipo.dart';
import 'package:tfg_liga_padel/Functions/tema/tema.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
          ChangeNotifierProvider(
          //Se carga el tema claro por defecto
          create: (_) => CargadorTema(0)),

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
        "/": (context) => BottomBarPappdel(1),
        //"/": (context) => const InicioSesion(),
        "/registro": (context) => const RegistroScreen(),
        "/dashboard": (context) => const DashboardPage(),
        "/dashboardSinEquipo": (context) =>  DashboardSinEquipo(),
        "/infoEquipo": (context) => const InfoEquipo(),
        "/infoJugador": (context) => const InfoJugador(),
      },
      theme: ThemeData(
        //textTheme: GoogleFonts.robotoTextTheme(),
        //textTheme: GoogleFonts.poppinsTextTheme(),
        textTheme: GoogleFonts.nunitoSansTextTheme(),
      ),
    );
  }
}
