//
//  ViewController.m
//  classUserDefaults
//
//  Created by Andy Malik on 3/8/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import "ViewController.h"
#import "AMUserDefaults.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UISwitch *switcherThing;

- (IBAction)switcherThingACTION:(UISwitch *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.switcherThing setOn:[[[AMUserDefaults sharedDefaults]objectForKey:@"switcherThing"]boolValue] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)switcherThingACTION:(UISwitch *)sender {
    [[AMUserDefaults sharedDefaults]setObject:@(sender.isOn) key:@"switcherThing"];
}

@end
