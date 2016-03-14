//
//  DisplayViewController.m
//  iOSSamples
//
//  Created by Joohae Kim on 2016. 3. 10..
//  Copyright © 2016년 Joohae Kim. All rights reserved.
//

#import "DisplayViewController.h"
#import <SNSServices/AuthenticationWebViewController.h>

@interface DisplayViewController ()
@property (weak, nonatomic) IBOutlet UILabel *passedMessage;

@end

@implementation DisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_passedMessage setText:_message];
    
    NSString *frameworkBundleID = @"kr.carrotbooks.SNSServices";
    NSBundle *frameworkBundle = [NSBundle bundleWithIdentifier:frameworkBundleID];

    AuthenticationWebViewController *awvc;
    awvc = [[AuthenticationWebViewController alloc] initWithNibName:@"AuthenticationWebViewController"
                                                             bundle:frameworkBundle];
    [self addChildViewController:awvc];
    awvc.view.frame = self.view.frame;
    [self.view addSubview:awvc.view];
    [awvc didMoveToParentViewController:self];
}

-(void)viewDidAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
