# KuKu Talk — Android Voice Calling Setup (Hindi)

## Is ZIP mein kya hai?
- Flutter Android app: Home, English course, Account aur Voice Calling screens.
- Agora voice call: Start, End, Mute aur Speaker controls.
- Node.js backend: Agora se short-lived token banane ke liye.
- Android permission aur Gradle app configuration.

## Pehle ye samajh lein
Yeh complete **source project** hai, ready-made APK nahi. Voice call chalane ke liye aapka Agora account, App ID, App Certificate aur internet par deployed backend zaroori hai. App Certificate sirf backend par rakhein. Is environment mein Flutter/Android SDK nahi hai, isliye APK build ya do phones par live call test ka daawa nahi kiya ja raha.

## Step 1 — Computer par project kholen
1. ZIP ko extract karein.
2. Computer mein Flutter stable, Android Studio aur Android SDK install karein.
3. Android Studio Terminal mein project folder kholen.
4. Ye commands ek-ek karke chalayein:

   ```bash
   flutter create --platforms=android .
   flutter pub get
   flutter analyze
   flutter test
   ```

`flutter create` aapke computer ke Flutter SDK ke hisaab se Gradle wrapper aur local configuration banata hai.

## Step 2 — Agora backend taiyar karein
1. Agora Console mein project banayein.
2. App ID aur App Certificate copy karein.
3. `backend` folder mein `.env.example` ki copy banakar uska naam `.env` rakhein.
4. `.env` mein `AGORA_APP_ID` aur `AGORA_APP_CERTIFICATE` ki jagah apni asli values dalein.
5. Certificate ko Flutter code, APK ya GitHub par kabhi upload na karein.
6. Node.js 20+ install karke terminal mein:

   ```bash
   cd backend
   npm install
   npm test
   npm start
   ```

7. Backend ko HTTPS wale public server par deploy karein. Sirf apne computer par `localhost` likhne se mobile phone backend tak nahi pahunch payega.
8. Browser mein `https://YOUR-BACKEND-DOMAIN/health` kholen. Health response mein `ok: true` aana chahiye.

## Step 3 — Android APK banayein
Project ke main folder mein:

```bash
flutter build apk --release --dart-define=TOKEN_SERVER_URL=https://YOUR-BACKEND-DOMAIN
```

APK yahan milega: `build/app/outputs/flutter-apk/app-release.apk`.

## Step 4 — Do phone se calling test
1. Dono Android phones mein wahi APK install karein.
2. Dono phones par KuKu Talk > Voice Calling kholen.
3. Dono mein apne backend ka same HTTPS URL dalein.
4. Dono mein channel ka bilkul same naam dalein, jaise `kuku-practice-room`.
5. Dono phones par Start Voice Call dabayein aur microphone permission allow karein.
6. Mute, Speaker aur End Call buttons test karein.

Har phone backend se alag UID aur token leta hai. Dono phones mein internet hona chahiye.

## Kya is version mein nahi hai?
Firebase Mobile OTP, Google Login, Premium Payment aur iPhone build is Android voice-calling version ka hissa nahi hain. Inhe alag se credentials aur implementation ke saath banana hoga.
