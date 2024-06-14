 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfg_liga_padel/Screens/info_equipo.dart';
import 'package:tfg_liga_padel/Functions/tema/tema.dart';

class InfoJugador extends StatelessWidget {
  const InfoJugador({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final temaActual = Provider.of<CargadorTema>(context);

    String nombreJugador = "Juan Pérez";
    String nombreUsuario = "Juanito20";
    String nombreEquipo = "WeCan Agüera Clínica Veterinaria";
    String fotoPerfilUrl = "https://imgs.search.brave.com/tlYaevyFMvS7g_JyxAqajsPuU09PuGm6HpGS68xqgYw/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5saWNkbi5jb20v/ZG1zL2ltYWdlL0M0/RTEyQVFGMmdSdm50/S2Y1b2cvYXJ0aWNs/ZS1jb3Zlcl9pbWFn/ZS1zaHJpbmtfNzIw/XzEyODAvMC8xNTg3/MjA0OTMxMDAwP2U9/MjE0NzQ4MzY0NyZ2/PWJldGEmdD1aRjRw/RzlBRjA4dGp2eTlI/TVplZWhZZ3VXeUEx/NGpHVmd0V1RQZXg0/aFJ3";


    Map<String, int> estadisticasJugador = {
      "Partidos jugados": 20,
      "Partidos ganados": 15,
      "Partidos perdidos": 5,
      "Sets ganados": 35,
      "Sets perdidos": 15,
      "Juegos ganados": 120,
      "Juegos perdidos": 60,
      "Ganados en 2 sets": 10,
      "Ganados en 3 sets": 5,
      "Perdidos en 2 sets": 3,
      "Perdidos en 3 sets": 2,
    };

    return DefaultTextStyle(
      style: TextStyle(color: temaActual.temaActual.colorScheme.onBackground),
      child: Scaffold(
        backgroundColor: temaActual.temaActual.colorScheme.background,
        appBar: AppBar(
          backgroundColor: temaActual.temaActual.colorScheme.secondary,
          title: Text('Ficha de Jugador', style: TextStyle(color: temaActual.temaActual.colorScheme.onSecondary),),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(fotoPerfilUrl),
                  ),
                ),
      
                const SizedBox(height: 24),
      
                Center(
                  child: Text(
                    nombreJugador,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
      
                const SizedBox(height: 8),
      
                Center(
                  child: Text(
                    nombreUsuario,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
      
                const SizedBox(height: 8),
      
                Center(
                  child: Text(
                    nombreEquipo,
                    style: TextStyle(
                      fontSize: 18,
                      color: temaActual.temaActual.colorScheme.onTertiary,
                    ),
                  ),
                ),
      
                const SizedBox(height: 20),
      
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Acción al hacer clic en el botón para ver info del equipo
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoEquipo(),
                        ),
                      );
                    },
                    child: const Text("Ver información del equipo"),
                  ),
                ),

                // Espacio con división con la lista de estadísticas
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
      
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  margin: const EdgeInsets.only(bottom: 16),
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
                            "Estadísticas del Jugador",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        children: estadisticasJugador.entries.map((entry) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 4.0),
                                child: Row(
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
                              ),
                          
                              if(entry.key != estadisticasJugador.entries.last.key) 
                                const Divider()
                            ],
                          );
                        }).toList(),
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
