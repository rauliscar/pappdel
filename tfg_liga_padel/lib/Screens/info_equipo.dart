import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tfg_liga_padel/tema/tema.dart';

class InfoEquipo  extends StatelessWidget {
  
  const InfoEquipo({super.key});
  

  @override
  Widget build(BuildContext context) {
    final temaActual = Provider.of<CargadorTema>(context).temaActual;

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    String nombreMiEquipo = "WeCan Agüera Clínica Veterinaria";
    String nombreLiga = "2ª Masculina";

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage("https://imgs.search.brave.com/tlYaevyFMvS7g_JyxAqajsPuU09PuGm6HpGS68xqgYw/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5saWNkbi5jb20v/ZG1zL2ltYWdlL0M0/RTEyQVFGMmdSdm50/S2Y1b2cvYXJ0aWNs/ZS1jb3Zlcl9pbWFn/ZS1zaHJpbmtfNzIw/XzEyODAvMC8xNTg3/MjA0OTMxMDAwP2U9/MjE0NzQ4MzY0NyZ2/PWJldGEmdD1aRjRw/RzlBRjA4dGp2eTlI/TVplZWhZZ3VXeUEx/NGpHVmd0V1RQZXg0/aFJ3"),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                nombreMiEquipo,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                nombreLiga,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}