# AI Assistant App

An AI-powered mobile application built with **Flutter** and **GetX** for state management.  
The app offers an AI ChatBot and a Multi-Language Translator with a clean and responsive UI.

---

## 📱 Features

- **Splash Screen** – Displays when the app starts.
- **Onboarding Screen** – Shown only once using **Hive** local storage.
- **Home Screen** – Central hub to access all features.
- **AI ChatBot** – Interact with an AI bot powered by the **Gemini API**.
- **Multi-Language Translator** – Translate text between multiple languages using the **Gemini API**.
- **Dynamic UI** – Lottie animations and smooth transitions.
- **Theme Support** – Auto switch between light and dark themes based on system settings.

---

## 🛠️ Tech Stack

- **Flutter**
- **GetX** (State Management)
- **Hive** (Local Storage)
- **Gemini API** (AI & Translation)
- **Lottie** (Animations)

---

## 📂 Project Structure

lib/
│── core/ # Routes, theme configuration
│── features/ # App features (ChatBot, Translator, Onboarding)
│── widgets/ # Reusable UI components
│── main.dart # App entry point

yaml
Copy
Edit

---

## 🚀 Getting Started

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/yourusername/ai-assistant-app.git
cd ai-assistant-app

2️⃣ Install Dependencies
bash
flutter pub get

3️⃣ Run the App
bash
flutter run

🔑 API Setup
Create a Gemini API key from Google AI Studio.

Store your API key securely in your app's configuration.
