import 'package:ejercicio/db/BasedeDatos.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                DBAdmin.db.getTasks();
              },
              child: Text("Mostrar Base de Datos"),
            ),
            ElevatedButton(
              onPressed: () {
                //DBAdmin.db.insertRawTask();
                DBAdmin.db.insertTask();
              },
              child: Text("Insertar Tarea"),
            ),
          ],
        ),
      ),
    );
  }
}
