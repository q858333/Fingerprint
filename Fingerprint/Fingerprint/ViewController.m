//
//  ViewController.m
//  Fingerprint
//
//  Created by DengBin on 15/12/14.
//  Copyright © 2015年 DB. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"输入指纹" forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)btnClick
{
    LAContext *myContext = [[LAContext alloc] init];
    
    NSError *authError = nil;
    
    NSString *myLocalizedReasonString = @"请输入指纹";
   
    
   
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
 
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
     
                  localizedReason:myLocalizedReasonString
  
                            reply:^(BOOL success, NSError *error) {
                   
                                if (success) {
                         
                                    // User authenticated successfully, take appropriate action
                   
                                } else {
          
                                    // User did not authenticate successfully, look at error and take appropriate action

                                }
                                
                                NSLog(@"%d",success);

                            }];

    } else {

        NSLog(@"授权失败");
        // Could not evaluate policy; look at authError and present an appropriate message to user

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
