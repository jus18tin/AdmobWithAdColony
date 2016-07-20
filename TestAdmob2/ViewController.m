//
//  ViewController.m
//  TestAdmob2
//
//  Created by Junhua Li on 2016/07/20.
//  Copyright © 2016年 Glossom,Inc. All rights reserved.
//

#import "ViewController.h"
@import GoogleMobileAds;
#import "GADMAdapterAdColonyInitializer.h"

@interface ViewController () <GADRewardBasedVideoAdDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // Not A Must. you can initialize the AdColony SDK early on in the application lifecycle and outside of the Google Mobile Ads SDK.
//  [GADMAdapterAdColonyInitializer startWithAppID:@"appbdee68ae27024084bb334a"
//                                       andZones:@[@"vzf8fb4670a60e4a139d01b5"]
//                                     andCustomID:nil];
  
  [GADRewardBasedVideoAd sharedInstance].delegate = self;
  [[GADRewardBasedVideoAd sharedInstance] loadRequest:[GADRequest request]
                                         withAdUnitID:@"ca-app-pub-4891026035420920/4599988296"];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


- (IBAction)showAd:(id)sender {
  if ([[GADRewardBasedVideoAd sharedInstance] isReady]) {
    [[GADRewardBasedVideoAd sharedInstance] presentFromRootViewController:self];
  }
}

- (void)rewardBasedVideoAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd
   didRewardUserWithReward:(GADAdReward *)reward {
  NSString *rewardMessage =
  [NSString stringWithFormat:@"Reward received with currency %@ , amount %lf",
   reward.type,
   [reward.amount doubleValue]];
  NSLog(rewardMessage);
}

- (void)rewardBasedVideoAdDidReceiveAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
  NSLog(@"Reward based video ad is received.");
}

- (void)rewardBasedVideoAdDidOpen:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
  NSLog(@"Opened reward based video ad.");
}

- (void)rewardBasedVideoAdDidStartPlaying:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
  NSLog(@"Reward based video ad started playing.");
}

- (void)rewardBasedVideoAdDidClose:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
  NSLog(@"Reward based video ad is closed.");
  [[GADRewardBasedVideoAd sharedInstance] loadRequest:[GADRequest request]
                                         withAdUnitID:@"ca-app-pub-4891026035420920/4599988296"];
}

- (void)rewardBasedVideoAdWillLeaveApplication:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
  NSLog(@"Reward based video ad will leave application.");
}

- (void)rewardBasedVideoAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd
    didFailToLoadWithError:(NSError *)error {
  NSLog(@"Reward based video ad failed to load. %@", error.localizedDescription);
}

@end
