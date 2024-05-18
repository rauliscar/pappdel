import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tfg_liga_padel/tema/tema.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);
  
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var height, width;

  @override
  Widget build(BuildContext context) {
    final temaActual = Provider.of<CargadorTema>(context).temaActual;

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    String nombreMiEquipo = "WeCan Agüera Clínica Veterinaria";
    String nombreUsuario = "Raúl Pérez de la Calle";

    return Scaffold(
      backgroundColor: temaActual.colorScheme.primary,
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
                                  style: const TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
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
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
          
                    //Icono notificaciones
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black.withOpacity(.1)
                      ),
                      child: IconButton(
                        onPressed: () {}, 
                        icon: const Icon(Icons.notifications),
                        color: Colors.white),
                    )
                  ],
                ),
              ),
          
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      margin: const EdgeInsets.only(top: 10.0),
                      child: const Row(
                        
                        children: [
                          Flexible(
                            child: Text(
                              "CIRCUITO DE PADEL AMATEUR",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                      
                    // Titulo próximos partidos        
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Row(
                        children: [
                          Text(
                            "Próximos partidos",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                      
                    //Lista de los próximos partidos         
                    SizedBox(
                      //height: 180,
                      height: height * .255,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        scrollDirection: Axis.horizontal,
                        children: [
                            
                          tarjetaProximoPartido("Tierra de Pinares", width),
                            
                          tarjetaProximoPartido("Recuperaciones Iscar", width),
                            
                          tarjetaProximoPartido("La Despensa de Ismar", width),
                      
                          tarjetaProximoPartido("Mi Equipo", width)
                      
                        ],
                      ),
                    ),
                      
                    const Divider(height: 10, indent: 25, endIndent: 25,),
                      
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      margin: const EdgeInsets.only(top: 15),
                      child: const Row(
                        children: [
                          Text(
                            "Últimos partidos",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                      
                    // //Lista de los próximos partidos         
                    SizedBox(
                    height: 150,
                    //height: height * .23,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        scrollDirection: Axis.horizontal,
                        children: [
                            
                          tarjetaPartidoJugado(3, 0, nombreMiEquipo, "Avisilman Pollitos"),
                            
                          tarjetaPartidoJugado(1, 2, "Recuperaciones Iscar", nombreMiEquipo),
                            
                          tarjetaPartidoJugado(2, 1, "Equipo Pruebas", nombreMiEquipo),       
                      
                        ],
                      ),
                    ),
                      
                    const Divider(height: 20, indent: 25, endIndent: 25,),
        
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      margin: const EdgeInsets.only(top: 15),
                      child: const Row(
                        children: [
                          Text(
                            "Clasificación",
                            style: TextStyle(
                              fontSize: 20,
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
                              style: const TextStyle(
                                fontSize: 17,
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

  Column tarjetaPartidoJugado(int ptosLocal, int ptosVisitante, equipoLocal, equipoVisitante) {
    Color colorGanador = const Color.fromARGB(255, 28, 116, 32);
    return Column(
      children: [
    
          DefaultTextStyle(
            style: TextStyle(
              fontSize: width * 0.042,
              color: Colors.black
            ),
            child: Expanded(
              //Tarjeta
              child: Container( 
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                margin:  EdgeInsets.only(right: height * 0.02),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: width * .6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
        
                          //Nombre del equipo local
                          Expanded(
                            flex: 6,
                            child: Text(
                              equipoLocal,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ptosLocal > ptosVisitante ? colorGanador : const Color.fromRGBO(66, 66, 66, 1),
                                fontWeight: ptosLocal > ptosVisitante ? FontWeight.bold : FontWeight.normal
                              ),
                            ),
                          ),
                          
                          //Puntos del equipo local
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: Text(
                                "$ptosLocal",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
              
                    Expanded(
                      flex: 1,
                      child: Divider(height: height * .01, thickness: 2,)
                    ),  
              
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
        
                          //Nombre del equipo visitante
                          Expanded(
                            flex: 6,
                            child: Text(
                              equipoVisitante,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ptosVisitante > ptosLocal ? colorGanador : Colors.grey.shade800,
                              ),
                            ),
                          ),
        
                          //Puntos del equipo visitante
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: Text(
                                "$ptosVisitante",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                
                  ],
                ),
              ),
            ),
          ),
      ]
    );
  }

  Container tarjetaProximoPartido(String nombreRival, double width) {
    return Container(
      margin: EdgeInsets.only(right: width * 0.04),
      height: height * .20,
      child: Column(
        children: [
      
            Container(
              margin: const EdgeInsets.only(bottom: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              height: height * .16,
              width: width * .45,
            ),

            Text(
              "Vs $nombreRival",
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
      
        ]
      ),
    );
  }
}