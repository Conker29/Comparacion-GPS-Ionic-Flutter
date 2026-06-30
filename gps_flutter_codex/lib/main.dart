import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GPS Flutter Codex',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String latitud = "";
  String longitud = "";
  String mensaje = "";

  Future<void> obtenerUbicacion() async {

    bool servicio = await Geolocator.isLocationServiceEnabled();

    if (!servicio) {
      setState(() {
        mensaje = "GPS desactivado";
      });
      return;
    }

    LocationPermission permiso =
        await Geolocator.checkPermission();

    if (permiso == LocationPermission.denied) {
      permiso = await Geolocator.requestPermission();
    }

    if (permiso == LocationPermission.deniedForever) {
      setState(() {
        mensaje = "Permiso denegado";
      });
      return;
    }

    Position posicion = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      latitud = posicion.latitude.toString();
      longitud = posicion.longitude.toString();
      mensaje = "Ubicación obtenida";
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("💕 GPS Flutter Codex"),
        backgroundColor: Colors.pink,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            ElevatedButton(
              onPressed: obtenerUbicacion,
              child: const Text("Obtener ubicación"),
            ),

            const SizedBox(height: 20),

            Text(
              mensaje,
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            Text(
              "Latitud: $latitud",
              style: const TextStyle(fontSize: 18),
            ),

            Text(
              "Longitud: $longitud",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}