# 📍 Comparación de GPS en Ionic y Flutter utilizando Codex y Antigravity

## Descripción del Proyecto

Este repositorio contiene el desarrollo de cuatro aplicaciones móviles creadas con el objetivo de comparar la implementación de servicios de geolocalización (GPS) utilizando los frameworks **Ionic** y **Flutter**, así como evaluar el apoyo proporcionado por las herramientas de inteligencia artificial **Codex** y **Antigravity** durante el proceso de desarrollo.

El proyecto fue realizado como parte de la asignatura **Aplicaciones Móviles** y busca analizar aspectos como facilidad de desarrollo, rendimiento, diseño de interfaces, manejo de errores y experiencia de usuario.

---

## Objetivos

### Objetivo General

Comparar la implementación de GPS en aplicaciones desarrolladas con Ionic y Flutter, utilizando las herramientas de inteligencia artificial Codex y Antigravity como apoyo para la generación de código.

### Objetivos Específicos

* Implementar geolocalización GPS en Ionic.
* Implementar geolocalización GPS en Flutter.
* Evaluar el comportamiento de cada framework.
* Analizar las capacidades de Codex y Antigravity en el desarrollo asistido por IA.
* Comparar el manejo de permisos, errores y rendimiento de las aplicaciones desarrolladas.

---

# Aplicaciones Desarrolladas

## 1. GPS Ionic + Codex

Aplicación desarrollada utilizando Ionic Framework y Capacitor Geolocation.

### Funcionalidades

* Obtención de ubicación actual.
* Solicitud de permisos de ubicación.
* Visualización de latitud y longitud.
* Manejo básico de errores.
* Compatibilidad con Android.

### Tecnologías

* Ionic
* Angular
* TypeScript
* Capacitor Geolocation

---

## 2. GPS Ionic + Antigravity

Aplicación desarrollada utilizando Ionic Framework con apoyo de Antigravity.

### Funcionalidades

* Obtención de coordenadas GPS.
* Diseño visual moderno.
* Manejo de errores de permisos.
* Integración con Google Maps.
* Interfaz mejorada mediante IA.

### Tecnologías

* Ionic
* Angular
* TypeScript
* Capacitor Geolocation

---

## 3. GPS Flutter + Codex

Aplicación desarrollada utilizando Flutter y la librería Geolocator.

### Funcionalidades

* Obtención de ubicación actual.
* Solicitud de permisos GPS.
* Visualización de coordenadas.
* Manejo de errores básicos.
* Compatibilidad con Android.

### Tecnologías

* Flutter
* Dart
* Geolocator

---

## 4. GPS Flutter + Antigravity

Aplicación desarrollada utilizando Flutter con apoyo de Antigravity.

### Funcionalidades

* Geolocalización en tiempo real.
* Diseño moderno y atractivo.
* Manejo de errores.
* Mejor experiencia visual.
* Compatibilidad con Android.

### Tecnologías

* Flutter
* Dart
* Geolocator

---

# Estructura del Repositorio

```text
Comparacion-GPS-Ionic-Flutter
│
├── GPS-Ionic-Codex
│
├── GPS-Ionic-Antigravity
│
├── GPS-Flutter-Codex
│
├── GPS-Flutter-Antigravity
│
├── Informe.pdf
│
└── README.md
```

---

# Instalación y Ejecución

## Requisitos Previos

* Node.js
* npm
* Ionic CLI
* Flutter SDK
* Android Studio
* Dispositivo Android o Emulador

---

## Ejecutar Aplicaciones Ionic

Ingresar al proyecto:

```bash
cd GPS-Ionic-Codex
```

o

```bash
cd GPS-Ionic-Antigravity
```

Instalar dependencias:

```bash
npm install
```

Ejecutar:

```bash
ionic serve
```

Compilar para Android:

```bash
ionic build
npx cap sync android
npx cap open android
```

---

## Ejecutar Aplicaciones Flutter

Ingresar al proyecto:

```bash
cd gps_flutter_codex
```

o

```bash
cd gps_flutter_antigravity
```

Instalar dependencias:

```bash
flutter pub get
```

Ejecutar:

```bash
flutter run
```

---

# Manejo de Errores Implementado

Las aplicaciones incluyen validaciones para:

* Permisos de ubicación denegados.
* GPS desactivado.
* Tiempo de espera excedido.
* Ubicación no disponible.
* Errores de conexión con servicios de localización.

---

# Comparación Ionic vs Flutter

| Característica       | Ionic                 | Flutter         |
| -------------------- | --------------------- | --------------- |
| Lenguaje             | TypeScript            | Dart            |
| Curva de aprendizaje | Baja                  | Media           |
| Rendimiento          | Bueno                 | Muy bueno       |
| Diseño de interfaces | Componentes web       | Widgets nativos |
| Acceso al GPS        | Capacitor Geolocation | Geolocator      |
| Tiempo de desarrollo | Rápido                | Medio           |
| Tamaño de aplicación | Menor                 | Mayor           |
| Experiencia visual   | Buena                 | Excelente       |

### Análisis

Ionic facilita el desarrollo para quienes ya poseen conocimientos en tecnologías web como HTML, CSS y JavaScript. Flutter ofrece un rendimiento superior y una experiencia visual más fluida gracias al uso de widgets nativos.

---

# Comparación Codex vs Antigravity

| Característica       | Codex     | Antigravity |
| -------------------- | --------- | ----------- |
| Generación de código | Excelente | Excelente   |
| Diseño visual        | Básico    | Avanzado    |
| Productividad        | Alta      | Alta        |
| Manejo de errores    | Bueno     | Muy bueno   |
| Facilidad de uso     | Alta      | Alta        |
| Calidad de interfaz  | Media     | Alta        |

### Análisis

Codex permitió generar rápidamente código funcional para las aplicaciones GPS. Antigravity destacó por proporcionar interfaces más modernas, mejor organización visual y una experiencia de usuario más atractiva.

---

# Resultados Obtenidos

* Se implementó correctamente la obtención de coordenadas GPS en Ionic y Flutter.
* Se verificó el funcionamiento de permisos de ubicación.
* Se comprobó el manejo de errores relacionados con GPS desactivado y permisos denegados.
* Se evaluó el comportamiento de Codex y Antigravity en la generación de código.
* Se realizaron pruebas en dispositivos Android reales.

---

# Conclusiones

1. Tanto Ionic como Flutter permiten implementar funcionalidades de geolocalización de forma eficiente mediante librerías especializadas.

2. Flutter presentó un mejor rendimiento visual y una experiencia de usuario más fluida, mientras que Ionic destacó por la rapidez de desarrollo utilizando tecnologías web.

3. Las herramientas de inteligencia artificial Codex y Antigravity contribuyeron significativamente a reducir el tiempo de desarrollo y facilitar la generación de código funcional.

---

# Autor

**Jhosselin Naula**

Escuela Politécnica Nacional

Asignatura: Aplicaciones Móviles

Periodo Académico 2026-A
