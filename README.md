# LED Strip Smart Controller

A professional Flutter + IoT smart LED strip controller inspired by commercial lighting systems such as Philips Hue, Govee, WLED, and Tuya.

The project demonstrates production-style Flutter architecture, modular ESP32 firmware, MQTT communication, and real-time LED animation control using WS2812B addressable LEDs.

---

# Project Name

**Flutter App:** Lumora

**Repository:** led-strip-smart-controller

---

# Goals

* Build a portfolio-quality Flutter + IoT application
* Learn production-ready MQTT communication
* Master ESP32-C3 development with PlatformIO
* Build a reusable FastLED animation engine
* Practice Clean Architecture and Riverpod
* Create an interview-ready GitHub project

---

# Hardware

* Seeed Studio XIAO ESP32-C3
* WS2812B RGB LED Strip (50 LEDs)
* Breadboard
* Jumper Wires
* USB Power

---

# Technology Stack

## Flutter

* Flutter 3.44.0
* Dart 3.12.0
* Material 3
* Riverpod
* GoRouter

## Firmware

* PlatformIO
* ESP32-C3
* FastLED

## Communication

* MQTT
* HiveMQ Public Broker
* JSON Messages

---

# Repository Structure

```text
led-strip-smart-controller/

├── lumora/                 # Flutter application
├── firmware/               # PlatformIO firmware
├── docs/                   # Documentation
├── assets/
└── README.md
```

---

# Flutter Architecture

```text
Presentation
      │
      ▼
Controllers
      │
      ▼
Repositories
      │
      ▼
MQTT Service
      │
      ▼
HiveMQ Broker
```

The application follows a layered architecture where each layer has a single responsibility.

---

# MQTT Topic Structure

```text
lumora/
└── devices/
    └── device01/
        ├── availability
        ├── state
        ├── telemetry
        ├── command/
        │   ├── power
        │   ├── brightness
        │   ├── color
        │   ├── effect
        │   ├── preset
        │   └── schedule
        └── config/
            ├── firmware
            └── settings
```

---

# Progress

## Day 1

* Repository initialized
* Flutter project created
* Application architecture defined
* Material 3 theme
* Dashboard foundation
* Riverpod setup
* Core utilities
* Logging
* Configuration

## Day 2

* MQTT protocol models
* MQTT topic hierarchy
* MQTT service
* JSON serialization
* Lighting repository
* Reactive DashboardController
* Riverpod integration
* Live MQTT communication pipeline
* Dashboard connected to repository
* HiveMQ integration

---

# Current Architecture

```text
Dashboard UI
      │
      ▼
DashboardController
      │
      ▼
LightingRepository
      │
      ▼
MqttService
      │
      ▼
HiveMQ Public Broker
```

---

# Upcoming Work

## Day 3

* PlatformIO firmware
* Wi-Fi Manager
* MQTT Manager
* JSON command parser
* State publisher
* FastLED initialization
* Non-blocking main loop

---

# Learning Objectives

This project covers:

* Flutter Clean Architecture
* Riverpod state management
* MQTT communication
* ESP32 programming
* FastLED
* Real-time embedded systems
* Non-blocking firmware
* Modular architecture
* IoT application design

---

# License

MIT
