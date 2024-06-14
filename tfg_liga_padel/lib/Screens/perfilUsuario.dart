// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tfg_liga_padel/Functions/tema/tema.dart'; // para el selector de fecha

class PerfilUsuario extends StatefulWidget {
  const PerfilUsuario({super.key});

  @override
  _PerfilUsuarioState createState() => _PerfilUsuarioState();
}

class _PerfilUsuarioState extends State<PerfilUsuario> {

  final _formKey = GlobalKey<FormState>();

  //Controllers
  TextEditingController equipoController = TextEditingController();
  TextEditingController nombreUsuarioController = TextEditingController();
  TextEditingController usuarioController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidosController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final temaActual = Provider.of<CargadorTema>(context).temaActual;

    String fotoPerfilUrl = "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fstatic.vecteezy.com%2Fsystem%2Fresources%2Fpreviews%2F002%2F275%2F847%2Foriginal%2Fmale-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg&f=1&nofb=1&ipt=74d764e35b45f9fca2376a52c0947dc1215b1022b3421f549c9e15f9652ef71d&ipo=images";

    equipoController.text = "Sin equipo";

    return Scaffold(
      backgroundColor: temaActual.colorScheme.background,
      appBar: AppBar(
        backgroundColor: temaActual.colorScheme.secondary,
        title: Text('Información del perfil', style: TextStyle(color: temaActual.colorScheme.onSecondary),),
      ),
      body: GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus?.unfocus(); // Quita el teclado cuando se toque fuera del TextField
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [

                const SizedBox(height: 15),
                
                // Circulo con la Imagen del perfil
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(fotoPerfilUrl),
                  ),
                ),

                const SizedBox(height: 20),

                // Botón de editar foto
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Abre añadir foto
                    },
                    style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(5.0),
                      backgroundColor: MaterialStatePropertyAll(temaActual.colorScheme.tertiary),
                      shadowColor: MaterialStatePropertyAll(temaActual.colorScheme.secondary),
                    ),
                  
                  child: Text('Editar Foto', style: TextStyle(color: temaActual.colorScheme.secondary, fontWeight: FontWeight.bold)),
                  ),
                ),

                const SizedBox(height: 20),

                // Botón para ver la ficha propia del jugador
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Abre la ficha del jugador
                      Navigator.pushNamed(context, "/infoJugador");
                    },
                    style:  ButtonStyle(
                      elevation: const MaterialStatePropertyAll(5.0),
                      backgroundColor: MaterialStatePropertyAll(temaActual.colorScheme.tertiary),
                      shadowColor: MaterialStatePropertyAll(temaActual.colorScheme.secondary),
                    ),
                  
                  child: Text('Mi ficha', style: TextStyle(color: temaActual.colorScheme.secondary, fontWeight: FontWeight.bold)),
                  ),
                ),

                const SizedBox(height: 20),
        
                // Título del campo equipo
                const Text(
                  'Equipo',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),
        
                // Campo de texto: Nombre de equipo
                TextField(
                  readOnly: true,
                  controller: equipoController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                
                const SizedBox(height: 15),

                const SizedBox(height: 20),
        
                // Título de datos de usuario
                const Text(
                  'Datos de usuario',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),
        
                // Campo de texto: Nombre de usuario
                TextFormField(
                  controller: nombreUsuarioController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre de usuario',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value==null || value.isEmpty) {
                      return 'Por favor, ingrese un nombre de usuario';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),
        
                 // Campo de texto: Email
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value==null || value.isEmpty || !value.contains('@')) {
                      return 'Por favor, ingrese un email válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
        
        
                // Título de datos de usuario
                const Text(
                  'Datos personales',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
        
        
                // Campo de texto: Nombre
                TextFormField(
                  controller: nombreController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value==null || value.isEmpty) {
                      return 'Por favor, ingrese un nombre';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),
        
                // Campo de texto: Apellidos
                TextFormField(
                  controller: apellidosController,
                  decoration: const InputDecoration(
                    labelText: 'Apellidos',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value==null || value.isEmpty) {
                      return 'Por favor, ingrese apellidos';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),
                
                // Campo de texto: Teléfono
                TextFormField(
                  controller: telefonoController,
                  decoration: const InputDecoration(
                    labelText: 'Teléfono',
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 9,
                  keyboardType: TextInputType.number, // Abre teclado numérico
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp('[,]')), // Evita la coma
                    FilteringTextInputFormatter.deny(RegExp('[.]')), // Evita el punto
                    FilteringTextInputFormatter.deny(RegExp('[-]')), // Evita el -
                    FilteringTextInputFormatter.deny(RegExp('[ ]')), // Evita el espacio
                  ],
                  validator: (value) {
                    if (value==null || value.isEmpty) {
                      return 'Por favor, ingrese un teléfono';
                    }else if(value.length != 9){
                      return 'Por favor, ingrese un teléfono válido';
                    } else if(value.length == 9){ // Si hay un valor de 9 dígitos
                    
                      // Verifica si el valor contiene solo dígitos
                      if (RegExp(r'^[0-9]+$').hasMatch(value)) {
                        int? numero = int.tryParse(value);

                        if (numero != null && numero > 0) {
                          return null; // La validación es exitosa
                        } else {
                          return "";
                        }
                      } else {
                        return "";
                      }
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 15),
        
                // Botón de edición
                ElevatedButton(
                  style:  ButtonStyle(
                    elevation: const MaterialStatePropertyAll(5.0),
                    backgroundColor: MaterialStatePropertyAll(temaActual.colorScheme.tertiary),
                    shadowColor: MaterialStatePropertyAll(temaActual.colorScheme.secondary),
                  ),
                  child: Text('Editar Datos', style: TextStyle(color: temaActual.colorScheme.secondary, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Aquí puedes agregar la lógica para registrar al usuario

                      Navigator.pop(context); // Vuelve a la pantalla de inicio de sesión
                       ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text("Se ha registrado correctamente"),
                          backgroundColor: temaActual.primaryColor,
                          duration: const Duration(seconds: 4),
                        ),
                      );
                    }
                  },
                ),

                const SizedBox(height: 15),

              ],
            ),
          ),
        ),
      ),
    );
  }
}