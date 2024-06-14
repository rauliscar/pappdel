import 'package:flutter/material.dart';
//import 'package:nb_utils/nb_utils.dart';
//import 'package:prokit_flutter/main.dart';

class DashboardSinEquipo extends StatefulWidget {
  const DashboardSinEquipo({Key? key}) : super(key: key);

  @override
  _DashboardSinEquipoState createState() => _DashboardSinEquipoState();
}

class _DashboardSinEquipoState extends State<DashboardSinEquipo> {
  @override
  void dispose() {
    //setStatusBarColor(appStore.scaffoldBackground!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Bienvenido/a a la liga de pádel!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: const Text('Aún no tienes un equipo',
              style: TextStyle(fontSize: 18), 
              textAlign: TextAlign.center
            ),
          ),

          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: const Text('Por favor, espera a que un administrador te asigne a un equipo.',
              style: TextStyle(fontSize: 17), 
              textAlign: TextAlign.center
            ),
          ),

          const SizedBox(height: 30),

          ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            }, 
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Volver"),

                SizedBox(width: 10),

                Icon(Icons.logout)
              ],
            )
          )
        ],
      )
    );
  }
}