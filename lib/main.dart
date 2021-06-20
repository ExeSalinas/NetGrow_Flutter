
import 'package:flutter/material.dart';

import 'package:netgrow/app_main.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
              color: Colors.red,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      "Error al conectar con el servidor",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Center(
                    child: Icon(
                      Icons.error_outline,
                      size: 40.0,
                      semanticLabel: "Error al conectar co el servidor",
                      color: Colors.amberAccent,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {

          return MyMaterialApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(
          child: Container(
            height: 80.0,
            width: 80.0,
            child: CircularProgressIndicator(
              strokeWidth: 8.0,
              semanticsLabel: "Iniciando",
            ),
          ),
        );
      },
    );
  }
}
