import 'package:flutter/material.dart';
import 'package:google_ad/screen/banner_ad_widget.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobScreen extends StatefulWidget {
  @override
  _AdMobScreenState createState() => _AdMobScreenState();
}

class _AdMobScreenState extends State<AdMobScreen> {
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;
  int rewardedPoints = 0;

  @override
  void initState() {
    super.initState();
    loadInterstitialAd();
    loadRewardedAd();
  }

  // Load Interstitial Ad
  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712', // Test Ad ID
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _interstitialAd!.fullScreenContentCallback =
              FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              _interstitialAd?.dispose();
              loadInterstitialAd();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              _interstitialAd?.dispose();
            },
          );
        },
        onAdFailedToLoad: (error) {
          print("Interstitial Ad failed to load: ${error.message}");
        },
      ),
    );
  }

  void showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.show();
    }
  }

  // Load Rewarded Ad
  void loadRewardedAd() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917', // Test Ad ID
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
        },
        onAdFailedToLoad: (error) {
          print("Rewarded Ad failed to load: ${error.message}");
        },
      ),
    );
  }

  void showRewardedAd() {
    if (_rewardedAd != null) {
      _rewardedAd!.show(
        onUserEarnedReward: (ad, reward) {
          print("User earned reward: ${reward.amount} ${reward.type}");
          setState(() {
            rewardedPoints += reward.amount.toInt();
          });
        },
        
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google AdMob Demo")),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Banner Ad "),
            BannerAdWidget(),
            Expanded(
                child: Center(
                  
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: showInterstitialAd,
                    child: Text("Show Interstitial Ad"),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: showRewardedAd,
                    child: Text("Show Rewarded Ad"),
                  ),
                  rewardedPoints > 0
                      ? Text(
                          "You've earned $rewardedPoints points!",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                        )
                      : Container(),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
