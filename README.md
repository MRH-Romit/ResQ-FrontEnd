# 🚨 ResQ - Emergency Response System

**ResQ** is a comprehensive mobile application designed to bridge the critical gap between citizens and emergency services. It provides a unified platform for citizens to report incidents and for emergency responders (Police, Fire, Volunteers) to manage and respond to crises efficiently.

## 📱 Project Overview

* **App Name:** ResQ Emergency Services
* **Target Audience:** Citizens, Police Officers, Firefighters, Volunteer Organizations.
* **Region:** Optimized for Bangladesh 🇧🇩 (Includes specific localizations like "+880" support).

## ✨ Key Features

### 1. 👥 Multi-Role Authentication
The app adapts its interface based on the user's role:
* **Citizens:** Report emergencies, view safety guides, track incidents.
* **Fire Service:** Receive fire alerts, view incident locations, manage dispatch.
* **Police:** Monitor crime reports, manage patrol units.
* **Volunteers (Red Crescent):** Coordinate relief efforts and team deployment.

### 2. 🤖 ChatQ - AI Emergency Assistant
A built-in AI chatbot that provides instant, offline-ready guidance for:
* 🔥 **Fire Safety:** Evacuation plans and immediate actions.
* 🌊 **Flood Protocols:** Preparation and safety during rising waters.
* 🏥 **First Aid:** CPR, burn treatment, and bleeding control.
* 🏚️ **Earthquake:** "Drop, Cover, and Hold On" instructions.

### 3. 🆘 Emergency Reporting
* **One-Tap SOS:** Immediate distress signal broadcasting location to nearest responders.
* **Incident Reporting:** Detailed reporting with image uploads and location tagging.

### 4. 📍 Location Services
* Real-time GPS tracking to pinpoint the exact location of victims.
* Interactive maps for responders to navigate to the scene.

---

## 🛠️ Tech Stack

* **Framework:** [Flutter](https://flutter.dev/) (Dart)
* **State Management:** `provider` package
* **Navigation:** Material Page Route
* **Local Storage:** `shared_preferences` (for session management)
* **Backend Integration:** HTTP (REST API)
* **UI Components:** Custom animated widgets, Curvy UI design, Pulse animations.


---

## 🚀 Getting Started

### Prerequisites
* [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
* VS Code or Android Studio.
* Android Emulator or Physical Device.

### Installation

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/yourusername/ResQ-FrontEnd.git](https://github.com/yourusername/ResQ-FrontEnd.git)
    cd ResQ-FrontEnd
    ```

2.  **Install Dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the App:**
    ```bash
    flutter run
    ```

---

## 🔐 Demo Credentials (Mock Mode)

Since the backend is currently mocked for demonstration purposes, use the following credentials to test different roles without signing up:

| Role | Username | Password | Dashboard Access |
| :--- | :--- | :--- | :--- |
| **Citizen** | `citizen` | `123456` | Standard User Home |
| **Admin** | `admin` | `admin123` | Admin Control Panel |
| **Fire Fighter** | `fire` | *(any)* | Fire Station Dashboard |
| **Police** | `police` | *(any)* | Police Dashboard |
| **Volunteer** | `volunteer` | *(any)* | Volunteer Dashboard |

> **Note:** You can also type any username containing "fire", "police", or "vol" to automatically be assigned that role during login in Demo Mode.

---

## 📂 Project Structure