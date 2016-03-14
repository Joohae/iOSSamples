//
//  DisplayViewController.m
//  iOSSamples
//
//  Created by Joohae Kim on 2016. 3. 10..
//  Copyright © 2016년 Joohae Kim. All rights reserved.
//

#import "DisplayViewController.h"
#import <SNSServices/SNSDeviceInstagram.h>
#import <SNSServices/AuthenticationWVCInstagram.h>

#define INSTAGRAM_CLIENT_ID     @"f4a8ac5d3c284448b7db0ad3d6912138"
#define INSTAGRAM_CLIENT_SECRET @"91868ff829874d37a58a9a9319f2c03b"
#define INSTAGRAM_REDIRECT_URL  @"http://www.carrotbooks.kr"

@interface DisplayViewController ()
@property (weak, nonatomic) IBOutlet UILabel *passedMessage;

@end

@implementation DisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_passedMessage setText:_message];

    SNSDeviceInstagram *instagram = [[SNSDeviceInstagram alloc] init];
    [instagram setClinetID:INSTAGRAM_CLIENT_ID secret:INSTAGRAM_CLIENT_SECRET andCallbackBase:INSTAGRAM_REDIRECT_URL];
    [instagram setDelegate:self];
    [instagram requestFileList];
    
    /*
     NSString *frameworkBundleID = @"kr.carrotbooks.SNSServices";
     NSBundle *frameworkBundle = [NSBundle bundleWithIdentifier:frameworkBundleID];
    
    AuthenticationWVCInstagram *awvc;
    awvc = [[AuthenticationWVCInstagram alloc] initWithNibName:@"AuthenticationWebViewController"
                                                             bundle:frameworkBundle];
    [self addChildViewController:awvc];
    CGRect webFrame = self.view.frame;
    webFrame.origin.y = (self.view.frame.size.height - 800) / 2;
    webFrame.origin.x = (self.view.frame.size.width - 600) / 2;
    webFrame.size.width = 600;
    webFrame.size.height = 800;
    awvc.view.frame = webFrame;
    
    [self.view addSubview:awvc.view];
    [awvc didMoveToParentViewController:self];
     */
}

-(void)viewDidAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SNS Service Delegates

-(void) SNSServiceError:(NSError *)error {
    NSLog(@"Error: %@", [[error userInfo] valueForKey:NSLocalizedDescriptionKey]);
}

-(UIViewController *) SNSWebAuthenticationRequired {
    return self;
}

-(void) SNSWebAuthenticationFailed:(NSError *)error {
    NSLog(@"SNSWebAuthenticationFailed: %@", error);
}

-(void) SNSWebAuthenticationSuccess {
    NSLog(@"SNSWebAuthenticationSuccess");
}

@end
