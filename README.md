# 🔌 Calculadora Electrónica — App Flutter

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=apple&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![Status](https://img.shields.io/badge/Estado-En%20desarrollo-yellow?style=for-the-badge)
![Version](https://img.shields.io/badge/Versión-1.0.0-blue?style=for-the-badge)

**Aplicación móvil open source de cálculos eléctricos y electrónicos con fines educativos. Construida con Flutter y Dart para Android e iOS.**

[Funcionalidades](#-funcionalidades) · [Stack](#-stack-tecnológico) · [Instalación](#-instalación) · [Arquitectura](#-arquitectura) · [Roadmap](#-roadmap)

</div>

---

## 📋 Tabla de Contenidos

- [¿Qué es este proyecto?](#-qué-es-este-proyecto)
- [Funcionalidades](#-funcionalidades)
- [Stack Tecnológico](#-stack-tecnológico)
- [Arquitectura](#-arquitectura)
- [Pantallas](#-pantallas)
- [Instalación](#-instalación)
- [Estructura del Proyecto](#-estructura-del-proyecto)
- [Gestión de Temas](#-gestión-de-temas)
- [Roadmap](#-roadmap)
- [Contribuciones](#-contribuciones)
- [Autor](#-autor)
- [Licencia](#-licencia)

---

## 🤖 ¿Qué es este proyecto?

**Calculadora Electrónica** es una aplicación móvil open source orientada a estudiantes y profesionales del área eléctrica y electrónica. Su objetivo es centralizar los cálculos más comunes del campo — como la Ley de Ohm, divisores de tensión, cálculo de resistencias, reactancias, filtros, entre otros — en una herramienta intuitiva y educativa disponible para Android e iOS.

El proyecto está construido con **Flutter y Dart**, lo que garantiza una sola base de código para ambas plataformas. Está pensado como una aplicación de código abierto donde la comunidad puede aportar nuevos módulos de cálculo.

---

## ✨ Funcionalidades

- 🏠 **Inicio** — Panel principal con acceso rápido a los módulos de cálculo
- 🔍 **Búsqueda** — Localizar fórmulas y calculadoras por nombre o categoría
- 🛒 **Tienda** — Sección de actualizaciones y contenido adicional
- ⚙️ **Ajustes** — Configuración de la aplicación:
  - 🌙 **Modo oscuro / claro** — Toggle adaptativo con cambio instantáneo de tema
  - 🌐 **Idioma** — Selector de idioma (Español / English) con bottom sheet
- 📲 **Diseño responsive** — Compatible con distintos tamaños de pantalla Android e iOS

---

## 🛠 Stack Tecnológico

| Capa | Tecnología | Versión |
|---|---|---|
| Framework | Flutter | `stable` |
| Lenguaje | Dart | `>=2.18.5 <3.0.0` |
| Gestión de estado | Provider | `latest` |
| Íconos | Material Icons + Cupertino Icons | `^1.0.2` |
| Plataformas | Android, iOS | — |

---

## 🏗 Arquitectura

El proyecto sigue una arquitectura **modular por pantallas** con gestión de estado global mediante `Provider` y `ChangeNotifier` para el tema de la aplicación.

```
┌─────────────────────────────────────────────────────┐
│                      MyApp                          │
│         ChangeNotifierProvider<ThemeChanger>        │
│                       │                             │
│              MaterialAppWithTheme                   │
│              (consume ThemeChanger)                 │
│                       │                             │
│                   HomePage                          │
│    ┌──────────────────┴──────────────────┐          │
│    │         bottomNavigator             │          │
│    │    (4 tabs — index 0 al 3)          │          │
│    └──────────────────┬──────────────────┘          │
│                       │                             │
│               Routes(index: i)                      │
│    ┌──────────────────────────────────┐             │
│    │  0: homePage     2: updatePage   │             │
│    │  1: searchPage   3: settingPage  │             │
│    └──────────────────────────────────┘             │
└─────────────────────────────────────────────────────┘
```

### Flujo de navegación

La navegación es **index-based**: el `BottomNavigationBar` emite el índice seleccionado mediante un callback `Function currentIndex`, que actualiza el estado en `_HomePageState` y hace que `Routes` renderice la pantalla correspondiente. No usa `Navigator.push` — todas las pantallas están preconstruidas en la lista de `Routes`.

### Gestión de temas

El tema se gestiona con `ThemeChanger`, un `ChangeNotifier` que envuelve un `ThemeData`:

```dart
class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;
  ThemeChanger(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();  // Reconstruye todo el árbol de widgets
  }
}
```

La app inicia en **modo oscuro** (`ThemeData.dark()`) y el switch en `settingPage` alterna entre `ThemeData.light()` y `ThemeData.dark()`.

---

## 📱 Pantallas

| Tab | Archivo | Estado | Descripción |
|---|---|---|---|
| 0 — Inicio | `homePage.dart` | 🚧 En desarrollo | Panel principal de calculadoras |
| 1 — Buscar | `searchPage.dart` | 🚧 En desarrollo | Búsqueda de fórmulas y módulos |
| 2 — Tienda | `updatesPage.dart` | 🚧 En desarrollo | Actualizaciones y contenido adicional |
| 3 — Ajustes | `settingPage.dart` | ✅ Implementado | Tema oscuro/claro + selector de idioma |

### Ajustes — Detalle de implementación

La pantalla de ajustes incluye dos componentes funcionales:

**Toggle de modo oscuro:**
```dart
Switch.adaptive(
  value: switchCurrenValue,
  onChanged: (bool valueIn) {
    if (switchCurrenValue == true) {
      theme.setTheme(ThemeData.light());
    } else {
      theme.setTheme(ThemeData.dark());
    }
    setState(() { switchCurrenValue = valueIn; });
  },
)
```

**Selector de idioma (bottom sheet):**
El idioma se selecciona desde un `ModalBottomSheet` con un `ListView.builder` que muestra `['Español', 'English']`.

---

## 🚀 Instalación

### Requisitos previos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) `>=2.18.5`
- [Dart SDK](https://dart.dev/get-dart) `>=2.18.5 <3.0.0`
- Android Studio o VS Code con la extensión de Flutter
- Emulador Android / iOS o dispositivo físico

### Pasos

```bash
# 1. Clonar el repositorio
git clone https://github.com/FryFr/calculadora_electronica.git
cd calculadora_electronica

# 2. Instalar dependencias
flutter pub get

# 3. Verificar entorno
flutter doctor

# 4. Correr en dispositivo/emulador
flutter run

# Para Android específicamente
flutter run -d android

# Para iOS (requiere Mac + Xcode)
flutter run -d ios
```

### Build de producción

```bash
# APK para Android
flutter build apk --release

# App Bundle para Play Store
flutter build appbundle --release

# IPA para iOS
flutter build ios --release
```

---

## 📁 Estructura del Proyecto

```
calculadora_electronica/
│
├── lib/
│   ├── main.dart                  # Entry point — Provider + MaterialApp
│   │
│   ├── naviBar/
│   │   └── botton_nav.dart        # BottomNavigationBar con 4 tabs
│   │
│   ├── screen/
│   │   ├── routes.dart            # Router index-based (lista de pantallas)
│   │   ├── homePage.dart          # Tab 0 — Inicio (en desarrollo)
│   │   ├── searchPage.dart        # Tab 1 — Buscar (en desarrollo)
│   │   ├── updatesPage.dart       # Tab 2 — Tienda (en desarrollo)
│   │   └── settingPage.dart       # Tab 3 — Ajustes (dark mode + idioma)
│   │
│   └── theme/
│       └── themeChange.dart       # ChangeNotifier para dark/light theme
│
├── android/                       # Proyecto Android nativo
├── ios/                           # Proyecto iOS nativo
├── test/
│   └── widget_test.dart           # Tests de widgets
├── pubspec.yaml                   # Dependencias y configuración
└── analysis_options.yaml          # Reglas de linting
```

---

## 🎨 Gestión de Temas

La aplicación arranca en **modo oscuro** por defecto. El `ChangeNotifierProvider` envuelve toda la app para que cualquier widget pueda consumir o cambiar el tema:

```dart
// En main.dart
ChangeNotifierProvider(
  create: (_) => ThemeChanger(ThemeData.dark()), // Tema inicial: oscuro
  child: MaterialAppWithTheme(),
)

// En cualquier widget
final theme = Provider.of<ThemeChanger>(context);
theme.setTheme(ThemeData.light()); // Cambia a modo claro
theme.getTheme();                  // Lee el tema actual
```

> 💡 **Para personalizar el tema**, reemplaza `ThemeData.dark()` y `ThemeData.light()` por instancias de `ThemeData` con colores, tipografía y formas personalizadas según la identidad visual de la app.

---

## 🗺 Roadmap

### Fase 1 — Fundación *(actual)*
- [x] Estructura de navegación con 4 tabs
- [x] Toggle dark/light mode con Provider
- [x] Selector de idioma (Español / English)

### Fase 2 — Módulos de Cálculo *(próximo)*
- [ ] **Ley de Ohm** — V = I × R, resolver cualquier variable
- [ ] **Código de colores de resistencias** — Lectura y conversión de bandas
- [ ] **Divisor de tensión** — Vout = Vin × (R2 / (R1 + R2))
- [ ] **Divisor de corriente**
- [ ] **Ley de Kirchhoff** (KVL y KCL)
- [ ] **Potencia eléctrica** — P = V × I = I²R = V²/R
- [ ] **Reactancia inductiva y capacitiva** — XL = 2πfL, XC = 1/(2πfC)
- [ ] **Filtros RC** — Frecuencia de corte fc = 1/(2πRC)

### Fase 3 — Experiencia de Usuario
- [ ] Localización completa ES/EN con `flutter_localizations`
- [ ] Historial de cálculos recientes
- [ ] Exportar resultados a PDF
- [ ] Animaciones de transición entre pantallas
- [ ] Modo de fórmulas — vista explicativa de cada ecuación

### Fase 4 — Distribución
- [ ] Publicación en **Google Play Store**
- [ ] Publicación en **Apple App Store**

---

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Especialmente para agregar nuevos módulos de cálculo.

1. **Fork** este repositorio
2. Crea tu rama:
   ```bash
   git checkout -b feature/ley-de-ohm
   ```
3. Crea tu pantalla de cálculo en `lib/screen/calculators/`
4. Agrégala al router y al home
5. Commitea con mensajes descriptivos:
   ```bash
   git commit -m "feat(calc): agregar calculadora de la Ley de Ohm"
   ```
6. Abre un **Pull Request**

### Convención de commits

| Prefijo | Uso |
|---|---|
| `feat(calc):` | Nuevo módulo de cálculo |
| `feat(ui):` | Cambio de interfaz |
| `fix:` | Corrección de bug |
| `docs:` | Solo documentación |
| `refactor:` | Reestructuración sin cambio funcional |
| `i18n:` | Cambios de traducción / localización |

---

## 👨‍💻 Autor

**Juan Silva Medina**
- GitHub: [@FryFr](https://github.com/FryFr)
- LinkedIn: [linkedin.com/in/jsilva-medina](https://www.linkedin.com/in/jsilva-medina/?skipRedirect=true)
- YouTube: [@juansilva4256](https://www.youtube.com/@juansilva4256)

---

## 📄 Licencia

Distribuido bajo la licencia **MIT**. Consulta el archivo [`LICENSE`](./LICENSE) para más detalles.

```
MIT License — Copyright (c) 2024 Juan Silva Medina
```

---

<div align="center">
  <sub>Hecho con ❤️ y Flutter para la comunidad de electrónica · ¿Te fue útil? Dale una ⭐ al repo</sub>
</div>
