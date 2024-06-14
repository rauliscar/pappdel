// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InfoEnfrentamiento extends StatefulWidget {
  const InfoEnfrentamiento({Key? key}) : super(key: key);

  @override
  _InfoEnfrentamientoState createState() => _InfoEnfrentamientoState();
}

class _InfoEnfrentamientoState extends State<InfoEnfrentamiento> {

  String fecha = "22/10/2023 12:30";
  String nombreSede = "Vega Sport";
  String nombreEquipoLocal = "H2O PADEL - DANIEL ITURRALDE Gonzalez";
  int partidosGanadosEquipoLocal = 2;
  int partidosGanadosEquipoVisitane = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Acta del partido"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Información Equipos Enfrentamiento
            Container(
              padding: const EdgeInsets.all(20.0),
              color: Colors.lightBlue[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //Fila con la sede
                  Row(
                    children: [
                      const Icon(Icons.location_pin),
                      
                      Flexible(
                        child: Text(
                          nombreSede,
                          style: const TextStyle(
                            fontSize: 16.0, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16.0),
                  
                  //Fila con la fecha
                  Row(
                    children: [
                      const Icon(Icons.calendar_month),
                      
                      Text(
                        fecha,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20.0),

                  //Fila con el nombre del equipo local y sus sets
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            //crossAxisAlignment: CrossAxisAlignment.cen,
                            children: [
                              // Foto Equipo Local
                              CircleAvatar(
                                radius: 25,
                                child: Image.asset(
                                  'assets/images/h2o_logo.png',
                                  errorBuilder: (context, error, stackTrace) {// Si al conseguir la imagen da algún error, se mostrará el icono
                                    return const Icon(Icons.image_not_supported_rounded, size: 45,);
                                  },
                                ),
                              ),

                              const SizedBox(width: 8.0),

                              // Nombre equipo Local
                              Flexible(
                                child: Text(
                                  nombreEquipoLocal,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                  overflow: TextOverflow.visible, // Para permitir el salto de línea
                                ),
                              )
                            ],
                          ),
                      
                          Text(
                            '2',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 16.0),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/club_logo.png',
                              errorBuilder: (context, error, stackTrace) {// Si al conseguir la imagen da algún error, se mostrará el icono
                                return const Icon(Icons.image_not_supported_rounded, size: 45,);
                              },
                            ),
                            const Text(
                              'CLUB PADEL VILLALON',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 16.0),

                     const  Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '1',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Partido 1
            buildPartido(
              'Partido 1',
              [
                {
                  'name': 'Hector Riquelme Perez',
                  'image': 'assets/images/profile_placeholder.png',
                },
                {
                  'name': 'Daniel Iturralde',
                  'image': 'assets/images/player1.png',
                },
              ],
              [1, 3, 0],
              [
                {
                  'name': 'MARTIN GARRIDO VILLALON',
                  'image': 'assets/images/profile_placeholder.png',
                },
                {
                  'name': 'Jose Manuel González Llana',
                  'image': 'assets/images/player2.png',
                },
              ],
              [6, 6, 0],
            ),
            // Partido 2
            buildPartido(
              'Partido 2',
              [
                {
                  'name': 'jacobo Martinez-Sagarra',
                  'image': 'assets/images/player3.png',
                },
                {
                  'name': 'Manuel Mora Conde',
                  'image': 'assets/images/profile_placeholder.png',
                },
              ],
              [6, 6, 0],
              [
                {
                  'name': 'javier garcia esteban',
                  'image': 'assets/images/player4.png',
                },
                {
                  'name': 'Javier Fernandez de la Mela',
                  'image': 'assets/images/profile_placeholder.png',
                },
              ],
              [3, 3, 0],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPartido(
    String title,
    List<Map<String, dynamic>> players1,
    List<int> scores1,
    List<Map<String, dynamic>> players2,
    List<int> scores2,
  ) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 16.0),
          buildPlayerRow(players1, scores1),
          const SizedBox(height: 16.0),
          buildPlayerRow(players2, scores2),
        ],
      ),
    );
  }

  Widget buildPlayerRow(
    List<Map<String, dynamic>> players,
    List<int> scores,
  ) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var player in players)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          player['image'],
                          errorBuilder: (context, error, stackTrace) {// Si al conseguir la imagen da algún error, se mostrará el icono
                            return const Icon(Icons.image_not_supported_rounded, size: 45,);
                          },),
                        const SizedBox(width: 8.0),
                        Text(
                          player['name'],
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
            ],
          ),
        ),

        const SizedBox(width: 16.0),
        
        for (var score in scores)
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Text(
                  score.toString(),
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}