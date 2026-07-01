# 💡 Lumora

**Lumora** is a portfolio-quality **Flutter + IoT** project that demonstrates how a commercial smart lighting system is designed and built.

Inspired by products such as Philips Hue, Govee, WLED, and Tuya Smart RGB Controllers, Lumora combines a modern Flutter application with modular ESP32 firmware to control WS2812B RGB LED strips over MQTT.

This repository is being developed sprint by sprint with a strong focus on production-ready architecture, clean code, embedded system design, and real-time communication.

---

## 🚀 Project Goals

* Build a professional smart RGB lighting controller
* Learn production-grade Flutter architecture
* Develop modular ESP32 firmware using FastLED
* Implement real-time MQTT communication
* Design a reusable LED animation engine
* Apply embedded software engineering best practices
* Create a portfolio-worthy GitHub project for Flutter + IoT opportunities

---

## ✨ Planned Features

### Flutter Application

* Modern Material 3 UI
* Device Dashboard
* RGB Color Picker
* Brightness Control
* Real-time MQTT Communication
* LED Effect Selection
* Effect Configuration
* Favorite Presets
* Scheduling
* Device Statistics
* Command History
* CSV Export
* Notifications
* Dark & Light Theme
* Multi-device Support (Future)

### ESP32 Firmware

* Modular Firmware Architecture
* Wi-Fi Manager
* MQTT Manager
* RGB Manager
* FastLED Integration
* Effect Engine
* Scheduler
* Configuration Manager
* Device Status Manager
* Non-blocking Animations
* State Machine Design
* OTA Updates (Future)

---

## 🛠️ Hardware

* Seeed Studio XIAO ESP32C3
* WS2812B RGB LED Strip (50 LEDs)
* Breadboard
* Jumper Wires
* USB Cable

---

## 📂 Repository Structure

```text
lumora/

├── flutter_app/
│   ├── lib/
│   ├── assets/
│   └── pubspec.yaml
│
├── firmware/
│   ├── src/
│   ├── include/
│   ├── lib/
│   └── platformio.ini
│
├── docs/
├── diagrams/
├── assets/
└── README.md
```

---

## 🏗️ Technology Stack

### Mobile

* Flutter
* Dart
* Riverpod
* MQTT Client
* Material 3

### Embedded

* ESP32-C3
* FastLED
* PlatformIO
* MQTT
* Wi-Fi

---

## 📡 MQTT Architecture

```text
lumora/

└── device01/

    ├── command
    ├── state
    ├── status
    ├── telemetry
    ├── config
    └── availability
```

---

## 🧠 Engineering Concepts Covered

Throughout this project, the following concepts will be implemented and explained:

* Clean Architecture
* Riverpod State Management
* Modular Embedded Design
* FastLED Programming
* Non-blocking Animations
* State Machines
* `millis()` Timing
* MQTT Design Patterns
* Real-time Communication
* Memory Optimization
* Performance Optimization
* Production-ready Project Organization

---

## 📅 Development Roadmap

* ✅ Project Architecture
* ⏳ MQTT Communication
* ⏳ RGB Color Control
* ⏳ Brightness Control
* ⏳ LED Effects
* ⏳ Animation Engine
* ⏳ Presets
* ⏳ Scheduling
* ⏳ Statistics
* ⏳ Notifications
* ⏳ History
* ⏳ Performance Optimization
* ⏳ OTA Updates
* ⏳ Multi-device Support

---

## 🎯 Purpose

Lumora is designed to demonstrate practical skills in:

* Flutter Development
* Embedded Systems
* IoT Application Development
* ESP32 Programming
* Real-time Communication
* Smart Home Technologies

The project is intended to serve as a strong portfolio piece for internships, freelance opportunities, and full-time Flutter + IoT or Embedded Software Engineering roles.

---

## 📄 License

This project is licensed under the MIT License.
