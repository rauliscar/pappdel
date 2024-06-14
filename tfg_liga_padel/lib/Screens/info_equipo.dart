import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tfg_liga_padel/Functions/mis_widgets.dart';
import 'package:tfg_liga_padel/Screens/editar_equipo.dart';
import 'package:tfg_liga_padel/Screens/info_jugador.dart';
import 'package:tfg_liga_padel/Functions/tema/tema.dart';

class InfoEquipo extends StatelessWidget {
  const InfoEquipo({super.key});

  @override
  Widget build(BuildContext context) {
    final temaActual = Provider.of<CargadorTema>(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    String nombreMiEquipo = "WeCan Agüera Clínica Veterinaria";
    String nombreLiga = "2ª Masculina";
    String logoUrl = "https://imgs.search.brave.com/tlYaevyFMvS7g_JyxAqajsPuU09PuGm6HpGS68xqgYw/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5saWNkbi5jb20v/ZG1zL2ltYWdlL0M0/RTEyQVFGMmdSdm50/S2Y1b2cvYXJ0aWNs/ZS1jb3Zlcl9pbWFn/ZS1zaHJpbmtfNzIw/XzEyODAvMC8xNTg3/MjA0OTMxMDAwP2U9/MjE0NzQ4MzY0NyZ2/PWJldGEmdD1aRjRw/RzlBRjA4dGp2eTlI/TVplZWhZZ3VXeUEx/NGpHVmd0V1RQZXg0/aFJ3";

    bool userIsCapitan = true;
    
    // Datos simulados que se obtendrían de la API
    Map<String, int> estadisticas = {
      "Puntos": 25,
      "Partidos jugados": 10,
      "Partidos ganados": 8,
      "Partidos perdidos": 2,
      "Sets ganados": 20,
      "Sets perdidos": 5,
      "Juegos ganados": 75,
      "Juegos perdidos": 30,
    };

    List<String> jugadores = [
      "Jugador 1",
      "Jugador 2",
      "Jugador 3",
      "Jugador 4",
      "Jugador 5",
    ];

    return DefaultTextStyle(
      style: TextStyle(color: temaActual.temaActual.colorScheme.onBackground),
      child: Scaffold(
        backgroundColor: temaActual.temaActual.colorScheme.background,
        appBar: AppBar(
          backgroundColor: temaActual.temaActual.colorScheme.secondary,
          title: Text('Ficha de equipo', style: TextStyle(color: temaActual.temaActual.colorScheme.onSecondary),),
          actions: [
            // Botón notificaciones
            Visibility(
              visible: userIsCapitan,
              child: IconButton(
                color: temaActual.temaActual.colorScheme.onSecondary,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditarEquipo(),
                    ),
                  );
                },
                icon: const Icon(Icons.edit_note),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(logoUrl),
                  ),
                ),
      
                const SizedBox(height: 24),

                //Nombre del equipo
                Center(
                  child: Text(
                    nombreMiEquipo,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 8),

                //Nombre del grupo
                Center(
                  child: Text(
                    nombreLiga,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // Espacio con división con la lista de estadísticas
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                    color: temaActual.temaActual.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExpansionTile(
                        iconColor: temaActual.temaActual.colorScheme.onSecondary, //Cuando está desplegado
                        collapsedIconColor: temaActual.temaActual.colorScheme.onSecondary, // Cuando está plegado
                        textColor: temaActual.temaActual.colorScheme.onSecondary, //Cuando está desplegado
                        collapsedTextColor: temaActual.temaActual.colorScheme.onSecondary, // Cuando está plegado
                        initiallyExpanded: true, // Inicialmente está desplegada
                        title: const Text(
                          "Jugadores",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        children: jugadores.map((nombreJugador) {
                          return ListTile(
                            title: Text(nombreJugador,
                              style: TextStyle(
                                fontSize: 20,
                                color: temaActual.temaActual.colorScheme.onSecondary,
                              ),
                            ),
                            leading: Icon(
                              Icons.person,
                              color: temaActual.temaActual.colorScheme.onSecondary,
                            ),
                            onTap: () {
                              // Acción al seleccionar un jugador
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InfoJugador(),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                    color: temaActual.temaActual.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExpansionTile(
                        iconColor: temaActual.temaActual.colorScheme.onSecondary, //Cuando está desplegado
                        collapsedIconColor: temaActual.temaActual.colorScheme.onSecondary, // Cuando está plegado
                        textColor: temaActual.temaActual.colorScheme.onSecondary, //Cuando está desplegado
                        collapsedTextColor: temaActual.temaActual.colorScheme.onSecondary, // Cuando está plegado
                        initiallyExpanded: false, //Inicialmente NO está desplegado
                        childrenPadding: const EdgeInsets.only(bottom: 10),
                        tilePadding: EdgeInsets.zero, // Elimina el padding del tile
                        backgroundColor: Colors.transparent,
                        collapsedBackgroundColor: Colors.transparent,
                        title: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            "Estadísticas del Equipo",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        children: estadisticas.entries.map((entry) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      entry.key,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: temaActual.temaActual.colorScheme.onSecondary,
                                      ),
                                    ),
                                    Text(
                                      entry.value.toString(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: temaActual.temaActual.colorScheme.onSecondary,
                                      ),
                                    ),
                                  ],
                                ),
      
                                if(entry.key != estadisticas.entries.last.key) 
                                  const Divider()
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
      
      
                const SizedBox(height: 24),

                // Lista desplegable para los próximos partidos
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                    color: temaActual.temaActual.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExpansionTile(
                        iconColor: temaActual.temaActual.colorScheme.onSecondary, //Cuando está desplegado
                        collapsedIconColor: temaActual.temaActual.colorScheme.onSecondary, // Cuando está plegado
                        textColor: temaActual.temaActual.colorScheme.onSecondary, //Cuando está desplegado
                        collapsedTextColor: temaActual.temaActual.colorScheme.onSecondary, // Cuando está plegado
                        initiallyExpanded: false, //Inicialmente NO está desplegado
                        childrenPadding: const EdgeInsets.only(bottom: 10),
                        tilePadding: EdgeInsets.zero, // Elimina el padding del tile
                        backgroundColor: Colors.transparent,
                        collapsedBackgroundColor: Colors.transparent,
                        title: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            "Próximos partidos",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        children: [
      
                          //Lista de los próximos partidos         
                          SizedBox(
                            //height: 180,
                            height: height * .255,

                            //Lista horizontal con las tarjetas de los próximos partidos 
                            child: ListView( 
                              scrollDirection: Axis.horizontal,
                              children: [
                                  
                                MisWidgets.tarjetaProximoPartido(context, nombreMiEquipo, "Tierra de Pinares", "17-03-2024", width, height),
                            
                                MisWidgets.tarjetaProximoPartido(context,"EquipoEjemplo2", nombreMiEquipo, "17-03-2024", width, height),
                                  
                                MisWidgets.tarjetaProximoPartido(context, nombreMiEquipo,"La Despensa de Ismar", "17-03-2024", width, height),
                            
                                MisWidgets.tarjetaProximoPartido(context,"Maristas" , nombreMiEquipo, "17-03-2024", width, height)
                            
                              ],
                            ),
                          ),
                          
                        ],
                        
                      ),
                    ],
                  ),
                ),
      
      
                const SizedBox(height: 24),

                // Lista desplegable para los partidos jugados
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                    color: temaActual.temaActual.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExpansionTile(
                        iconColor: temaActual.temaActual.colorScheme.onSecondary, //Cuando está desplegado
                        collapsedIconColor: temaActual.temaActual.colorScheme.onSecondary, // Cuando está plegado
                        textColor: temaActual.temaActual.colorScheme.onSecondary, //Cuando está desplegado
                        collapsedTextColor: temaActual.temaActual.colorScheme.onSecondary, // Cuando está plegado
                        initiallyExpanded: false, //Inicialmente NO está desplegado
                        childrenPadding: const EdgeInsets.only(bottom: 10),
                        tilePadding: EdgeInsets.zero, // Elimina el padding del tile
                        backgroundColor: Colors.transparent,
                        collapsedBackgroundColor: Colors.transparent,
                        title: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            "Partidos jugados",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        children: [
      
                          // //Lista de los partidos jugados        
                          SizedBox(
                          height: 150,
                          //height: height * .23,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                  
                                MisWidgets.tarjetaPartidoJugado(context, width, height, 2, 0, nombreMiEquipo, "Avisilman Pollitos"),
                              
                                MisWidgets.tarjetaPartidoJugado(context, width, height, 1, 2, "Recuperaciones Iscar", nombreMiEquipo),
                                  
                                MisWidgets.tarjetaPartidoJugado(context, width, height, 2, 1, "Equipo Pruebas", nombreMiEquipo),      
                            
                              ],
                            ),
                          ),
      
                        ],
                        
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
