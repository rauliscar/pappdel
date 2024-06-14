import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tfg_liga_padel/Functions/mis_widgets.dart';
import 'package:tfg_liga_padel/Functions/tema/tema.dart';

class DashboardPage extends StatefulWidget{
  const DashboardPage({Key? key}) : super(key: key);
  
  @override
  // ignore: library_private_types_in_public_api
  _DashboardPageState createState() => _DashboardPageState();
  
}

class _DashboardPageState extends State<DashboardPage> {

  var height, width;

  @override
  Widget build(BuildContext context) {
    final temaActual = Provider.of<CargadorTema>(context);

    bool isDark = temaActual.temaOscuro;

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    String nombreMiEquipo = "WeCan Agüera Clínica Veterinaria";
    String nombreUsuario = "Raúl Pérez de la Calle";

    return Scaffold(
      backgroundColor: temaActual.temaActual.colorScheme.secondary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
          
              //Contenedor con la cabecera 
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                alignment: Alignment.bottomCenter,
                height: 130,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
              
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  nombreUsuario,
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: temaActual.temaActual.colorScheme.onSecondary
                                  ),
                                ),
                              ),
                            ],
                          ),
          
                          const SizedBox(height: 5,),
                          
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  nombreMiEquipo,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: temaActual.temaActual.colorScheme.onSecondary
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
          
                    //Icono cambio de tema
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black.withOpacity(.1)
                      ),
                      child: IconButton(
                        onPressed: () {temaActual.temaOscuro = !temaActual.temaOscuro;}, 
                        icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                        color: temaActual.temaActual.colorScheme.onSecondary),
                    )
                  ],
                ),
              ),
          
              Container(
                decoration: BoxDecoration(
                  color: temaActual.temaActual.colorScheme.background,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        
                        children: [
                          Flexible(
                            child: Text(
                              "CIRCUITO DE PADEL AMATEUR",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: temaActual.temaActual.colorScheme.onBackground
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                      
                    // Titulo próximos partidos        
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Próximos partidos",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: temaActual.temaActual.colorScheme.onBackground
                            ),
                          ),
                        ],
                      ),
                    ),
                      
                    //Lista de los próximos partidos         
                    SizedBox(
                      //height: 180,
                      height: height * .280,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        scrollDirection: Axis.horizontal,
                        children: [
                            
                          MisWidgets.tarjetaProximoPartido(context, nombreMiEquipo, "Tierra de Pinares", "17-03-2024", width, height),
                            
                          MisWidgets.tarjetaProximoPartido(context,"EquipoEjemplo2", nombreMiEquipo, "17-03-2024", width, height),
                            
                          MisWidgets.tarjetaProximoPartido(context, nombreMiEquipo,"La Despensa de Ismar", "17-03-2024", width, height),
                      
                          MisWidgets.tarjetaProximoPartido(context,"Maristas" , nombreMiEquipo, "17-03-2024", width, height)
                      
                        ],
                      ),
                    ),
                      
                    const Divider(height: 10, indent: 25, endIndent: 25,),
                      
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      margin: const EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Text(
                            "Últimos partidos",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: temaActual.temaActual.colorScheme.onBackground
                            ),
                          ),
                        ],
                      ),
                    ),
                      
                    // //Lista de los partidos jugados        
                    SizedBox(
                    height: 150,
                    //height: height * .23,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        scrollDirection: Axis.horizontal,
                        children: [
                            
                          MisWidgets.tarjetaPartidoJugado(context, width, height, 2, 0, nombreMiEquipo, "Avisilman Pollitos"),
                            
                          MisWidgets.tarjetaPartidoJugado(context, width, height, 1, 2, "Recuperaciones Iscar", nombreMiEquipo),
                            
                          MisWidgets.tarjetaPartidoJugado(context, width, height, 2, 1, "Equipo Pruebas", nombreMiEquipo),       
                      
                        ],
                      ),
                    ),
                      
                    const Divider(height: 20, indent: 25, endIndent: 25,),
        
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      margin: const EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Text(
                            "Clasificación",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: temaActual.temaActual.colorScheme.onBackground
                            ),
                          ),
                        ],
                      ),
                    ),
        
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      margin: const EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              "1. $nombreMiEquipo",
                              style: TextStyle(
                                fontSize: 17,
                                color: temaActual.temaActual.colorScheme.onBackground
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
        
                    const Divider(height: 40, indent: 25, endIndent: 25,),
                      
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}