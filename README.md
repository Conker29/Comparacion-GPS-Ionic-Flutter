# Comparación GPS: Ionic vs Flutter

Este repositorio contiene una comparación práctica del uso de geolocalización (GPS) entre dos frameworks móviles multiplataforma: **Ionic (Angular)** y **Flutter**. Cada framework se implementó dos veces, generadas con dos asistentes de codificación distintos (**Antigravity** y **Codex**), con el fin de comparar resultados.

En total hay **4 proyectos**:

| Proyecto | Framework | Asistente usado | Estado |
|---|---|---|---|
| `GPS-Ionic-Antigravity/mi-app` | Ionic + Angular | Antigravity | Scaffold base (sin lógica GPS implementada) |
| `GPS-Ionic-Codex/mi-app-codex` | Ionic + Angular | Codex | Scaffold base (sin lógica GPS implementada) |
| `gps_flutter_antigravity` | Flutter | Antigravity | Funcional, con obtención de GPS |
| `gps_flutter_codex` | Flutter | Codex | Funcional, con obtención de GPS |

---

## 1. `GPS-Ionic-Antigravity/mi-app`

Aplicación **Ionic 8 + Angular 20** (standalone components), generada con el starter oficial de Ionic ("tabs"). Contiene la estructura típica de un proyecto Ionic en blanco:

- `src/app/tab1`, `tab2`, `tab3`: tres pestañas de navegación de ejemplo.
- `src/app/tabs`: configuración del `ion-tabs` y rutas.
- `src/app/explore-container`: componente reutilizable de bienvenida.
- Dependencias: `@ionic/angular`, `@capacitor/core`, `ionicons`.

**Estado actual:** es el scaffold base del starter de Ionic; todavía no incluye la lógica de obtención de coordenadas GPS (no se agregó el plugin `@capacitor/geolocation` ni código en `tab1.page.ts`). Sirve como punto de partida para implementar y comparar la funcionalidad de geolocalización en Ionic.

**Cómo ejecutar:**
```bash
cd GPS-Ionic-Antigravity/mi-app
npm install
ionic serve
```

---

## 2. `GPS-Ionic-Codex/mi-app-codex`

Aplicación **Ionic 8 + Angular 20**, idéntica en estructura a la anterior (mismo starter "tabs"), pero generada en la sesión de trabajo con el asistente **Codex**. Permite comparar, en igualdad de condiciones, cómo cada asistente aborda un mismo proyecto base de Ionic.

**Estado actual:** scaffold base sin lógica GPS implementada (igual que el proyecto anterior).

**Cómo ejecutar:**
```bash
cd GPS-Ionic-Codex/mi-app-codex
npm install
ionic serve
```

---

## 3. `gps_flutter_antigravity`

Aplicación **Flutter**, generada con el asistente **Antigravity**, que implementa una pantalla única (`GPSPage`) con:

- Verificación de si el servicio de ubicación está activo.
- Solicitud y validación de permisos de ubicación.
- Obtención de la posición actual (`Geolocator.getCurrentPosition`) con alta precisión.
- Interfaz con tema rosa, tarjeta con sombra, ícono de ubicación y botón para refrescar la latitud/longitud.

**Paquete clave:** `geolocator: ^12.0.0`

**Cómo ejecutar:**
```bash
cd gps_flutter_antigravity
flutter pub get
flutter run
```

---

## 4. `gps_flutter_codex`

Aplicación **Flutter**, generada con el asistente **Codex**, que resuelve el mismo objetivo (obtener GPS) que la anterior pero con una implementación independiente:

- Misma lógica de verificación de servicio/permisos y obtención de posición con `geolocator`.
- Interfaz más simple: `AppBar` rosa, botón "Obtener ubicación" y textos planos con el mensaje de estado, latitud y longitud (sin tarjeta ni íconos).

**Paquete clave:** `geolocator: ^12.0.0`

**Cómo ejecutar:**
```bash
cd gps_flutter_codex
flutter pub get
flutter run
```

---

## Objetivo de la comparación

Este repositorio busca evaluar, para una misma funcionalidad (obtención de coordenadas GPS del dispositivo):

1. **Ionic vs Flutter**: diferencias de enfoque, dependencias y complejidad entre un framework híbrido basado en web (Ionic/Angular + Capacitor) y un framework compilado nativo (Flutter).
2. **Antigravity vs Codex**: diferencias en el código generado por cada asistente de IA ante el mismo requerimiento, dentro de un mismo framework.

## Requisitos generales

- **Proyectos Flutter:** Flutter SDK instalado (`flutter doctor` sin errores), permisos de ubicación configurados en Android (`ACCESS_FINE_LOCATION`) e iOS (`NSLocationWhenInUseUsageDescription`).
- **Proyectos Ionic:** Node.js, Ionic CLI (`npm install -g @ionic/cli`) y, para probar el GPS en dispositivo/emulador, el plugin `@capacitor/geolocation` (pendiente de agregar) junto con Capacitor configurado (`npx cap add android` / `npx cap add ios`).
