
// ignore_for_file: use_build_context_synchronously

//import 'package:control_medicamentos/Functions/colores.dart';
//import 'package:control_medicamentos/Functions/registro_stepper.dart';
import 'package:flutter/material.dart';
import 'dart:core';

import 'package:provider/provider.dart';
import 'package:tfg_liga_padel/Functions/bottom_bar.dart';
import 'package:tfg_liga_padel/Functions/tema/tema.dart';
import 'package:tfg_liga_padel/Screens/dashboard.dart';


class InicioSesion extends StatefulWidget {
  const InicioSesion({super.key});

  @override
  State<InicioSesion> createState() => _InicioSesionState();
}

class _InicioSesionState extends State<InicioSesion> {

  //Controllers
  TextEditingController  nombreUsuarioController = TextEditingController();
  TextEditingController  contrasenaController = TextEditingController();

  //KEY
  final _formKey = GlobalKey<FormState>();

  //Objeto que almacenará el usuario que ha iniciado sesión
  //Usuario usuarioInicioSesion = Usuario();

  //Asigna un objeto usuario a través del nombre de usuario
  // Future<void> asignarUsuarioCampo(bool modolocal, String nombreUsuario) async {
  //   usuarioInicioSesion = await usuarioInicioSesion.getUsuarioPorNombreUsuario(modolocal, nombreUsuario);
  // }

  @override
  void initState() {

  }
  
  @override
  Widget build(BuildContext context) {

    final temaActual = Provider.of<CargadorTema>(context);

    //final modoTrabajo=Provider.of<ModoTrabajo>(context);

    // Provider que permitirá setear el usuario si las credenciales son correctas
    //final usuarioProvider = Provider.of<UsuarioProvider>(context, listen: false);

    // Provider para setear el perfil del usuario que se mostrará, tomará el valor del usuario que inicia sesión, luego se puede cambiar en configuración del perfil si es un usuario administrador
    //final perfilUsuarioProvider = Provider.of<PerfilUsuario>(context, listen: false);

    return Scaffold(
      //backgroundColor: MisColores.colorAppBar,

      // Body
      body: GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus?.unfocus(); // Quita el teclado cuando se toque fuera del TextField
        },
        child: SafeArea(
          child: Container(
            //padding: const EdgeInsets.only(),
            // Decoración del fondo
            decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   colors: [
              //     temaActual.temaActual.primaryColor,  // Color inicial del gradiente
              //     MisColores.colorAppBar,
              //     MisColores.colorLista,  // Color final del gradiente
              //   ],
              //   begin: Alignment.topLeft,   // Punto de inicio del gradiente
              //   end: Alignment.bottomCenter,  // Punto de finalización del gradiente
              // ),
              color: temaActual.temaActual.colorScheme.secondary
            ),
          
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                      
                Container(
                  padding: const EdgeInsets.all(5.0),
                  margin: const EdgeInsets.only(top: 100.0, left: 70.0, right: 70.0),
                  width: 105,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: const Color.fromRGBO(0, 0, 0, 1)),
                  ),
                  child: Image.network(
                    "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimg.freepik.com%2Ffree-vector%2Fprofessional-padel-logo-template_23-2149222275.jpg%3Fw%3D740%26t%3Dst%3D1674480836~exp%3D1674481436~hmac%3D16beac42e3337273a352f845c4dd48deafedd2e3ff14bde37157d8441fc7c54e&f=1&nofb=1&ipt=31f93a1b07a95c36e5f87dfa75b8001eaeb320ebaa2e056ff14af3da4a8c0c64&ipo=images",
                    errorBuilder: (context, error, stackTrace) {// Si al conseguir la imagen da algún error, se mostrará el icono
                      return const Icon(Icons.image_not_supported_rounded, size: 45);
                    },
                    width: 180,
                    height: 180,
                  ),
                ),
                
                //Contenedor con el formulario
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  // decoration: const BoxDecoration(
                  //     borderRadius: BorderRadius.all(Radius.circular(15)), //Redondeo de esquinas del contenedor
                  //     gradient: LinearGradient(
                  //       colors: [
                  //         MisColores.colorAppBar,
                  //         MisColores.colorLista,  // Color inicial del gradiente
                  //         Color.fromARGB(255, 133, 110, 166),  // Color final del gradiente
                  //       ],
                  //       begin: Alignment.topCenter,   // Punto de inicio del gradiente
                  //       end: Alignment.bottomRight,  // Punto de finalización del gradiente
                  //     ),
                  //   ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20.0, top: 50.0),
                          child: TextFormField(
                          
                            controller: nombreUsuarioController, //Asigna el controlador
                            validator: (valor) { //Se controla que el campo no esté vacío
                              if (valor==null || valor.isEmpty) {
                                return "El nombre de usuario es obligatorio";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              labelText: 'Usuario',
                              filled: true,
                              fillColor: temaActual.temaActual.cardColor,
                            ),
                          ),
                        ),
                  
                  
                        Container(
                          margin: const EdgeInsets.only(bottom: 40.0),
                          child: TextFormField(
                          
                            controller: contrasenaController, //Asigna el controlador
                            validator: (valor) { //Se controla que el campo no esté vacío
                              if (valor==null || valor.isEmpty) {
                                return "La contraseña obligatoria";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              labelText: 'Contraseña',
                              filled: true,
                              fillColor: temaActual.temaActual.cardColor,
                            ),
                          ),
                        ),     
                      ],
                    ),
                  ),
                ),
            
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    //RegistroStepper(),
                    ElevatedButton(   
                      style: ButtonStyle(
                         elevation: const MaterialStatePropertyAll(5.0),
                        backgroundColor: MaterialStatePropertyAll(temaActual.temaActual.colorScheme.tertiary),
                        shadowColor: MaterialStatePropertyAll(temaActual.temaActual.colorScheme.secondary),
                        minimumSize: const MaterialStatePropertyAll(Size(120, 40)),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/registro"); // Abre la pantalla de registro
                      },
                      child: const Text(
                        'Registrarse', 
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                          ),
                        ),  
                    ),
                
                    ElevatedButton(   
                      style: ButtonStyle(
                         elevation: const MaterialStatePropertyAll(5.0),
                        backgroundColor: MaterialStatePropertyAll(temaActual.temaActual.colorScheme.tertiary),
                        shadowColor: MaterialStatePropertyAll(temaActual.temaActual.colorScheme.secondary),
                        minimumSize: const MaterialStatePropertyAll(Size(120, 40)),
                        // side: MaterialStatePropertyAll(BorderSide(
                        //   color: Colors.black,
                        //   width: 2.0
                        // )),
                        //fixedSize: MaterialStatePropertyAll(Size(100, 50)),
                      ),
                      onPressed: () async {
                        
                        //Valida el formulario
                        // if (_formKey.currentState!.validate()){
                        //   const Center (child: CircularProgressIndicator());
                
                        //   await asignarUsuarioCampo(modoTrabajo.modoLocal, nombreUsuarioController.text); //Busca el usuario del campo usuario en la base de datos y lo asigna, de manera asíncrona
                
                        //   if(usuarioInicioSesion.idUsuario! > 0){ //Si el usuario que asigna el método anterior tiene id > 0, quiere decir que ha modificado el que se encontraba por defecto y que existe.
                        //     if(contrasenaController.text.compareTo(usuarioInicioSesion.password) == 0){ //Si las contraseñas coinciden pasa a inicio
                        //       usuarioProvider.setUsuario(usuarioInicioSesion); //Actualiza la información del usuario del provider a la del usuario que inicia sesión.
                        //       perfilUsuarioProvider.setPerfilUsuario(usuarioInicioSesion); //Actualiza la información del perfil de usuario del provider a la del usuario que inicia sesión.
                               Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BottomBarPappdel(0)
                                )); // Abre la pantalla de inicio
                        //     } else{ //Muestra un snackBar de contraseña incorrecta
                        //       ScaffoldMessenger.of(context).showSnackBar(
                        //         const SnackBar(
                        //           content: Text("La contraseña es incorrecta"),
                        //           backgroundColor: MisColores.colorAppBar,
                        //           duration: Duration(seconds: 4),
                        //         ),
                        //       );
                        //     }
                        //   } else{ //Muestra un mensaje de usuario incorrecto
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //         const SnackBar(
                        //           content: Text("El usuario no existe"),
                        //           backgroundColor: MisColores.colorAppBar,
                        //           duration: Duration(seconds: 4),
                        //         ),
                        //       );
                        //   }
                
                        // }
                
                      },
                      //Texto del botón
                      child: const Text(
                        'Iniciar Sesión', 
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                          ),
                        ),  
                )
                  ],
                )
                      
              ],
            ),
          ),
        ),
      ),
    );
  }
}
