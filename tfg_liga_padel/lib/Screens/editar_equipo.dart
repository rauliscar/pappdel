import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfg_liga_padel/Functions/tema/tema.dart';

class EditarEquipo extends StatelessWidget {
  const EditarEquipo({super.key});

  @override
  Widget build(BuildContext context) {
    final temaActual = Provider.of<CargadorTema>(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    String nombreMiEquipo = "WeCan Agüera Clínica Veterinaria";

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
          iconTheme: IconThemeData(color: temaActual.temaActual.colorScheme.onSecondary),
          title: Text('Edición de equipo', style: TextStyle(color: temaActual.temaActual.colorScheme.onSecondary),),
        ),

        body: SafeArea(
          child: DefaultTextStyle(
            style: TextStyle(color: temaActual.temaActual.colorScheme.onPrimary, fontWeight: FontWeight.w400),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 20),

                  Center(
                    child: Text(
                      nombreMiEquipo,
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
            
                  // Espacio con división con la lista de jugadores
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 20),
            
                  //Lista de los jugadores
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: jugadores.length,
                    itemBuilder: (context, index) {
                      final jugador = jugadores[index];
                      return ListTile(
                        title: Text(jugador),
                        leading: Icon(
                          Icons.person,
                          color: temaActual.temaActual.colorScheme.onSecondary,
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            // Acción para borrar el jugador (aquí puedes implementar la lógica de borrado)
                            // Por ejemplo, podrías eliminar el jugador del listado jugadores
                            // jugadores.removeAt(index);
                            // Luego, podrías actualizar el estado si fuera necesario
                            // setState(() {});
                          },
                        ),
                      );
                    },
                  ),
            
                  const SizedBox(height: 20),
            
                  // Botón de añadir jugador
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Abre un cuadro de diálogo para añadir un nuevo jugador al equipo
                      },
                      style: ButtonStyle(
                        elevation: const MaterialStatePropertyAll(8.0),
                        backgroundColor: MaterialStatePropertyAll(temaActual.temaActual.colorScheme.tertiary),
                        shadowColor: MaterialStatePropertyAll(temaActual.temaActual.colorScheme.secondary),
                        //textStyle: MaterialStatePropertyAll(TextStyle(color: temaActual.temaActual.colorScheme.secondary))
                      ),
                    
                    child: Text('Añadir Jugador', style: TextStyle(color: temaActual.temaActual.colorScheme.secondary, fontWeight: FontWeight.bold)),
                    ),
                  ),
            
                  const SizedBox(height: 10),
            
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
