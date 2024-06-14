import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tfg_liga_padel/Functions/tema/tema.dart';

class MisWidgets extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  static Container tarjetaProximoPartido(context, String nombreEquipoLocal, String nombreEquipoVisitante, String fechaEnfrentamiento, double width, double height) {
    final temaActual = Provider.of<CargadorTema>(context);

  return Container(
    margin: EdgeInsets.only(right: width * 0.04),
    //height: height *.50,
    child: DefaultTextStyle(
      style: TextStyle(color: temaActual.temaActual.colorScheme.onTertiary),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 0.0),
            decoration: BoxDecoration(
              color: temaActual.temaActual.colorScheme.tertiary,
              borderRadius: BorderRadius.circular(20),
            ),
            height: height *.24,
            width: width *.50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        nombreEquipoLocal,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                            
                      const SizedBox(height: 3,),
                            
                      const Text(
                        textAlign: TextAlign.center,
                        "Vs",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                            
                      const SizedBox(height: 3,),
                            
                      Text(
                        textAlign: TextAlign.center,
                        nombreEquipoVisitante,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),

                      
                    ],
                  ),
                ),

                const Divider(),
      
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        fechaEnfrentamiento,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}



  static Column tarjetaPartidoJugado(context, double width, double height, int setsLocal, int setsVisitante, equipoLocal, equipoVisitante) {
    final temaActual = Provider.of<CargadorTema>(context);
    var colorGanador = temaActual.temaActual.colorScheme.surface;
    return Column(
      children: [
    
          DefaultTextStyle(
            style: TextStyle(
              fontSize: width * 0.042,
              color: temaActual.temaActual.colorScheme.onTertiary
            ),
            child: Expanded(
              //Tarjeta
              child: Container( 
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                margin:  EdgeInsets.only(right: height * 0.02),
                decoration: BoxDecoration(
                  color: temaActual.temaActual.colorScheme.tertiary,
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
                                color: setsLocal > setsVisitante ? colorGanador : temaActual.temaActual.colorScheme.onTertiary,
                                fontWeight: setsLocal > setsVisitante ? FontWeight.bold : FontWeight.w500
                              ),
                            ),
                          ),
                          
                          //Puntos del equipo local
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: Text(
                                "$setsLocal",
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
                                color: setsVisitante > setsLocal ? colorGanador : temaActual.temaActual.colorScheme.onTertiary,
                                fontWeight: setsLocal > setsVisitante ? FontWeight.bold : FontWeight.w500
                              ),
                            ),
                          ),
        
                          //Puntos del equipo visitante
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: Text(
                                "$setsVisitante",
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
}

