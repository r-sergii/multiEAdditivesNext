// import 'package:flutter/material.dart';
// import 'package:admanager_web/admanager_web.dart';

// class AdsWeb extends StatefulWidget {
//   const AdsWeb({Key? key}) : super(key: key);
//   @override
//   AdsWebState createState() => AdsWebState();
// }

// class AdsWebState extends State<AdsWeb> {
//   final _adRewarded = AdRewarded();
//   bool _adRewardedReady = false;

//   @override
//   void initState() {
//     super.initState();
//     // loadRewarded();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       loadRewarded();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 0.0),
//       child: _adRewardedReady
//           ? AdBlock(
//               size: width > 750 ? [AdBlockSize.leaderboard] : [AdBlockSize.mobileLeaderboard],
//               // size: [AdBlockSize.mediumRectangle],//300x250
//               // size: [AdBlockSize.mobileBanner], //300x50
//               // size: [AdBlockSize.leaderboard],//728x90
//               // size: [AdBlockSize.mobileLeaderboard],//320x50
//               // size: [AdBlockSize.skyscraper],//120x600
//               // size: [AdBlockSize.wideSkyscraper],//160x600
//               //
//               // size: [AdBlockSize.largeRectangle],
//               // size: [AdBlockSize.mobileBannerLarger],
//               // size: [AdBlockSize.banner],
//               // size: [AdBlockSize.helfPage],
//               adUnitId: "/6355419/Travel/Europe",
//             )
//           : const SizedBox(),
//     );
//   }

//   void loadRewarded() {
//     _adRewarded.load(
//       // adUnitId: "/6355419/Travel/Europe",
//       adUnitId: '/22639388115/rewarded_web_example',
//       onAdLoaded: () => setState(() {
//         _adRewardedReady = true;
//       }),
//     );
//   }

//   // void grantReward(int amount) {
//   //   loadRewarded();
//   //   _adRewarded.show(
//   //       onAdClosed: (){},
//   //       onGranted: (int amount){},
//   //   );
//   // }
// }
