
import 'package:flutter/material.dart';
import 'package:tfg_liga_padel/Screens/home.dart';

// ignore: must_be_immutable
class BottomNavigationBarExampleApp extends StatelessWidget {

  // Por defecto, 0
  int _selectedIndex = 0;

  BottomNavigationBarExampleApp(int itemActivo, {super.key}){
    _selectedIndex = itemActivo;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBarExample(itemActivo: _selectedIndex);
  }
}


//Clase 2
class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key, required this.itemActivo});

  final int itemActivo;

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}


//Clase 3
class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {

  int _index = 0;

  @override
  void initState() {
    super.initState();
    _index = widget.itemActivo;
  }

  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    //NestedTabBar(),// Contiene la pantalla de inicio
    HomePage(),
    //Medicamentos(),
    //Reposiciones()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    //final perfilUsuarioProvider = Provider.of<PerfilUsuario>(context, listen: false); // Contiene el perfil del usuario del que se muestra la información


    // Atributo para el titulo del appbar, depende de en qué ficha nos encontremos
    // String tituloAppBar = "";

    // // Condición para determinar el título del AppBar
    // if (_index == 0) {
    //   tituloAppBar = 'Inicio  |  ${perfilUsuarioProvider.perfilUsuario.nombre}';
    //   // miAppBar = ClassAppBarInicio(titleText: tituloAppBar);
    // } else if (_index == 1) {
    //   tituloAppBar = 'Tratamientos';
    // } else if (_index == 2) {
    //   tituloAppBar = 'Medicamentos';
    // } else if (_index == 3) {
    //   tituloAppBar = 'Reposiciones';
    // }

    return Scaffold(
      
      //backgroundColor: MisColores.colorAppBar,
      //appBar: ClassAppBar(titleText: tituloAppBar),
      //drawer: const ClassDrawer(), 
      body: Center(
        child: _widgetOptions.elementAt(_index),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, //cambia cómo se disponen los elementos en la barra
        //backgroundColor: MisColores.colorBottomBar,
        unselectedItemColor: Colors.black,
        //selectedItemColor: MisColores.colorAppBar,
        unselectedLabelStyle: const TextStyle(
          color: Colors.black
        ),
        iconSize: 32,
        selectedFontSize: 13,
        unselectedFontSize: 12,
        items: const[

          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              ),
            activeIcon: Icon(
              Icons.home
            ),
            label: 'Inicio',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.medical_information_outlined),
            activeIcon: Icon(
              Icons.medical_information_sharp
            ),
            label: 'Tratamientos',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.medication_outlined),
            activeIcon: Icon(
              Icons.medication
            ),
            label: 'Medicamentos',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.autorenew_outlined),
            activeIcon: Icon(
              Icons.autorenew
            ),
            label: 'Reposiciones',
          ),
        ],

        currentIndex: _index,
        onTap: _onItemTapped,

      ),
    );
  }
}
