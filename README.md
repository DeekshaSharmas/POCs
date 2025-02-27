Google AdMob Ads in Flutter 🚀
This Flutter project demonstrates the integration of Google AdMob ads, including Banner Ads, Interstitial Ads, and Rewarded Ads.

📌 Features
✅ Display Banner Ads at the top of the screen.
✅ Show Interstitial Ads on button click.
✅ Show Rewarded Ads and grant points to users.
✅ Handle ad loading and error handling efficiently.
✅ Use state management to update UI dynamically.

📂 Project Structure
📦 google_ads_flutter
 ┣ 📂 lib
 ┃ ┣ 📜 main.dart             # Main app file (Handles Ads logic)
 ┃ ┣ 📜 banner_ad_widget.dart # Separate widget for Banner Ads
 ┣ 📜 pubspec.yaml            # Dependencies
 ┗ 📜 README.md               # Documentation (This file)
 
📲 Setup & Installation
Prerequisites
Ensure you have:
✅ Flutter installed (flutter doctor to check)
✅ A Google AdMob account (Sign up here)
✅ An AdMob App ID and Ad Unit IDs

Clone the Repository

git clone https://github.com/your-username/google-ads-flutter.git
cd google-ads-flutter

Add Dependencies
Ensure you have google_mobile_ads added in pubspec.yaml:

Add AdMob App ID in Android & iOS
🔹 Android Setup
Open android/app/src/main/AndroidManifest.xml
Add your AdMob App ID inside <application> tag:

<meta-data
    android:name="com.google.android.gms.ads.APPLICATION_ID"
    android:value="ca-app-pub-3940256099942544~3347511713"/> <!-- Replace with your AdMob App ID -->
🔹 iOS Setup
Open ios/Runner/Info.plist
Add the following inside <dict>:
<key>GADApplicationIdentifier</key>
<string>ca-app-pub-3940256099942544~3347511713</string> <!-- Replace with your AdMob App ID -->
<key>SKAdNetworkItems</key>
<array>
    <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>cstr6suwn9.skadnetwork</string>
    </dict>
</array>
🖥️ Running the Project
Run the app on a physical device or emulator with:

flutter run
📺 Ad Units Used (Test Ads)
Ad Type    Ad Unit ID
Banner Ad    ca-app-pub-3940256099942544/6300978111
Interstitial Ad    ca-app-pub-3940256099942544/1033173712
Rewarded Ad    ca-app-pub-3940256099942544/5224354917
👉 Replace with your own AdMob ad unit IDs in production!

