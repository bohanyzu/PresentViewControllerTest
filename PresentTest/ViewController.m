//
//  ViewController.m
//  PresentTest
//
//  Created by chinaums on 14-7-17.
//  Copyright (c) 2014年 ChinaUMS. All rights reserved.
//

#import "ViewController.h"
#import "Test1ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(60, 200, 200, 100);
    [button addTarget:self action:@selector(showPresent) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Button" forState:UIControlStateNormal];
    
    [self.view addSubview:button];
}

- (void)showPresent {
    Test1ViewController *controller1 = [[Test1ViewController alloc] init];
    [self.tabBarController.navigationController pushViewController:controller1 animated:YES];
    
    Test1ViewController *controller = [[Test1ViewController alloc] init];
    controller.delegate = self;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    [self.tabBarController.navigationController presentViewController:nav animated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 100, 60);
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Navbar Button" forState:UIControlStateNormal];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.tabBarController.navigationItem.rightBarButtonItem = item;
}

- (void)buttonPressed {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"The button works!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
