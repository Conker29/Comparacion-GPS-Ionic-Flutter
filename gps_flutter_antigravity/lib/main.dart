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
      title: 'GPS Flutter Antigravity',
      theme: ThemeData(
        colorSchemeSeed: Colors.pink,
      ),
      home: const GPSPage(),
    );
  }
}

class GPSPage extends StatefulWidget {
  const GPSPage({super.key});

  @override
  State<GPSPage> createState() => _GPSPageState();
}

class _GPSPageState extends State<GPSPage> {

  String latitud = "--";
  String longitud = "--";
  String estado = "Presiona el botón";

  Future<void> obtenerGPS() async {

    bool servicio = await Geolocator.isLocationServiceEnabled();

    if (!servicio) {
      setState(() {
        estado = "GPS desactivado";
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
        estado = "Permiso denegado";
      });
      return;
    }

    Position posicion = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      latitud = posicion.latitude.toString();
      longitud = posicion.longitude.toString();
      estado = "Ubicación obtenida correctamente";
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFFFFF0F6),

      appBar: AppBar(
        title: const Text("💕 GPS Flutter Antigravity"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  )
                ],
              ),

              child: Column(
                children: [

                  const Icon(
                    Icons.location_on,
                    size: 80,
                    color: Colors.pink,
                  ),

                  const SizedBox(height: 10),

                  Text(
                    estado,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "Latitud\n$latitud",
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Longitud\n$longitud",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: obtenerGPS,
              icon: const Icon(Icons.gps_fixed),
              label: const Text("Obtener Ubicación"),
            ),
          ],
        ),
      ),
    );
  }
}