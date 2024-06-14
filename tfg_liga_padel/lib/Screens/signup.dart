// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tfg_liga_padel/Functions/tema/tema.dart'; // para el selector de fecha

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  _RegistroScreenState createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {

  final _formKey = GlobalKey<FormState>();

  //Controllers
  TextEditingController  nombreUsuarioController = TextEditingController();
  TextEditingController  contrasenaController = TextEditingController();
  TextEditingController  usuarioController = TextEditingController();
  TextEditingController  emailController = TextEditingController();
  TextEditingController  nombreController = TextEditingController();
  TextEditingController  apellidosController = TextEditingController();
  TextEditingController  telefonoController = TextEditingController();
  TextEditingController  dniController = TextEditingController();
  TextEditingController  fechaNacimientoController = TextEditingController();

  // Campos de texto
  late String _gender = "M";

  // Fecha de nacimiento
  DateTime _birthDate = DateTime.now();

  @override
  Widget build(BuildContext context) {

    final temaActual = Provider.of<CargadorTema>(context);

    return Scaffold(
      backgroundColor: temaActual.temaActual.colorScheme.background,
      appBar: AppBar(
        backgroundColor: temaActual.temaActual.colorScheme.secondary,
        title: Text('Registro', style: TextStyle(color: temaActual.temaActual.colorScheme.onSecondary),),
      ),
      body: GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus?.unfocus(); // Quita el teclado cuando se toque fuera del TextField
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
        
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
        
                // Campo de texto: Contraseña
                TextFormField(
                  controller: contrasenaController,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value==null || value.isEmpty) {
                      return 'Por favor, ingrese una contraseña';
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
                
        
                // Título de género
                const SizedBox(height: 15),
                const Text(
                  'Género',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
        
        
                // Campo de género
                Row(
                  children: [
                    Radio(
                      value: 'M',
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    ),
                    const Text('Masculino'),
                    Radio(
                      value: 'F',
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    ),
                    const Text('Femenino'),
                  ],
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
        
                // Campo de texto: DNI
                TextFormField(
                  controller: dniController,
                  decoration: const InputDecoration(
                    labelText: 'DNI',
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 9,
                  validator: (value) {
                    if (value==null || value.isEmpty) {
                      return 'Por favor, ingrese un DNI';
                    } else if(value.length != 9){
                      return 'Por favor, ingrese un DNI válido';
                    } else if(value.length == 9){
                      // Extrae el último carácter de la cadena
                      String lastChar = value[value.length - 1];

                      // Comprueba si el último carácter es una letra
                      if (RegExp(r'[a-zA-Z]$').hasMatch(lastChar)){
                        return "Introduce un DNI válido";
                      } 
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
        
                // Selector de fecha de nacimiento
                Row(
                  children: [
                    const Flexible( //Hace flexible el titulo para que pueda colocarse en dos líneas
                      child: Text(
                        'Fecha de nacimiento:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                    ),

                    const SizedBox(width: 10),
                    
                    // Botón de la fecha
                    ElevatedButton(
                      style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(5.0),
                      backgroundColor: MaterialStatePropertyAll(temaActual.temaActual.colorScheme.tertiary),
                      shadowColor: MaterialStatePropertyAll(temaActual.temaActual.colorScheme.secondary),
                    ),
                      child: Text(
                        DateFormat('dd/MM/yyyy').format(_birthDate),
                      ),
                      onPressed: () async {
                          final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: _birthDate,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null) {
                          setState(() {
                            _birthDate = picked;
                          });
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
        
                // Botón de registro
                ElevatedButton(
                  style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(5.0),
                      backgroundColor: MaterialStatePropertyAll(temaActual.temaActual.colorScheme.tertiary),
                      shadowColor: MaterialStatePropertyAll(temaActual.temaActual.colorScheme.secondary),
                    ),
                  child: const Text('Registrarse'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Aquí puedes agregar la lógica para registrar al usuario

                      Navigator.pop(context); // Vuelve a la pantalla de inicio de sesión
                       ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text("Se ha registrado correctamente"),
                          backgroundColor: temaActual.temaActual.primaryColor,
                          duration: const Duration(seconds: 4),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}