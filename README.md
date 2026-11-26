# KuKu Talk — Android Voice Calling Starter

Flutter Android app for two-way voice practice using Agora RTC. Includes a Flutter home screen, English course/account information screens, a live voice-call screen (join/leave, mute, speaker), and a Node.js service that issues short-lived Agora RTC tokens.

## Important

This is a **source project**, not a prebuilt APK. You must add your own Agora App ID and App Certificate to the backend and deploy it at a reachable HTTPS URL. The App Certificate must never be included in the Android app. Build and real two-device calling tests require Flutter/Android SDK tools and two Android phones.

Phone OTP, Google sign-in, subscriptions/payments, and iOS are not included in this Android voice-calling deliverable.

## Android build

1. Install Flutter stable, Android Studio, and Android SDK on a computer.
2. Extract this ZIP and open the `KuKu-Talk-Complete-Source` folder in Android Studio.
3. From that folder run:

   ```bash
   flutter create --platforms=android .
   flutter pub get
   flutter analyze
   flutter test
   flutter build apk --release --dart-define=TOKEN_SERVER_URL=https://YOUR-BACKEND-DOMAIN
   ```

4. APK output: `build/app/outputs/flutter-apk/app-release.apk`.

`flutter create --platforms=android .` generates the machine-specific Gradle wrapper and local Flutter SDK path that should not be copied from another computer.

## Deploy the token backend

1. Create an Agora project in Agora Console and copy its App ID and App Certificate.
2. In `backend`, copy `.env.example` to `.env`; set `AGORA_APP_ID` and `AGORA_APP_CERTIFICATE`.
3. Install Node.js 20 or later, then run:

   ```bash
   cd backend
   npm install
   npm test
   npm start
   ```

4. Deploy the backend to a public server with HTTPS. Keep `.env` secret and out of GitHub. Restrict `ALLOWED_ORIGIN` where practical and add user authentication/rate limiting before public production release.
5. Check `https://YOUR-BACKEND-DOMAIN/health`. It should return `{"ok":true,"service":"kuku-talk-token-service"}`.

## Connect two Android phones

1. Install the same app build on both phones.
2. Open Voice Calling on each and enter the deployed token server URL.
3. Enter the exact same channel name on both phones (for example `kuku-practice-room`).
4. Tap Start Voice Call on both phones and allow microphone access.
5. Use Mute, Speaker, and End Call as needed.

Each phone requests its own unique UID and short-lived RTC token from the backend. Both phones must have internet access and the backend must be reachable from their networks.

## Project configuration

- Android application ID: `com.kuku.talk`
- Minimum Android SDK: 24
- Flutter packages: `agora_rtc_engine`, `permission_handler`, `http`, `shared_preferences`
- Token endpoint: `POST /agora/token` with JSON `{ "channelName": "room-name", "uid": 12345 }`
- Health endpoint: `GET /health`
