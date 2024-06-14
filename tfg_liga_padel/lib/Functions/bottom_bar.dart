
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfg_liga_padel/Functions/tema/tema.dart';
import 'package:tfg_liga_padel/Screens/dashboard.dart';
import 'package:tfg_liga_padel/Screens/info_equipo.dart';
import 'package:tfg_liga_padel/Screens/perfilUsuario.dart';

// ignore: must_be_immutable
class BottomBarPappdel extends StatelessWidget {

  // Por defecto, 0
  int _selectedIndex = 0;

  BottomBarPappdel(int itemActivo, {super.key}){
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

  int _index = 1;

  @override
  void initState() {
    super.initState();
    _index = widget.itemActivo;
  }

  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    //NestedTabBar(),// Contiene la pantalla de inicio
    InfoEquipo(),
    DashboardPage(),
    PerfilUsuario()
    //Reposiciones()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final temaActual = Provider.of<CargadorTema>(context);

    //final perfilUsuarioProvider = Provider.of<PerfilUsuario>(context, listen: false); // Contiene el perfil del usuario del que se muestra la información

    return Scaffold(
      
      //backgroundColor: MisColores.colorAppBar,
      //appBar: ClassAppBar(titleText: tituloAppBar),
      //drawer: const ClassDrawer(), 
      body: Center(
        child: _widgetOptions.elementAt(_index),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: temaActual.temaActual.colorScheme.primary,
        type: BottomNavigationBarType.shifting, //cambia cómo se disponen los elementos en la barra
        //backgroundColor: MisColores.colorBottomBar,
        unselectedItemColor: Colors.black,
        selectedItemColor: temaActual.temaActual.colorScheme.onPrimary,
        unselectedLabelStyle: const TextStyle(
          color: Colors.black
        ),
        //iconSize: 25,
        unselectedIconTheme: const IconThemeData(size: 20),
        selectedIconTheme: const IconThemeData(size: 25),
        selectedFontSize: 12,
        unselectedFontSize: 10,
        items: const[

          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            activeIcon: Icon(
              Icons.people
            ),
            label: 'Mi Equipo',
          ),

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
            icon: Icon(Icons.person),
            activeIcon: Icon(
              Icons.person
            ),
            label: 'Perfil',
          ),
        ],

        currentIndex: _index,
        onTap: _onItemTapped,

      ),
    );
  }
}
