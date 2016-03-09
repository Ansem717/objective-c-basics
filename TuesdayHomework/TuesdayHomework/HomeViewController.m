//
//  ViewController.m
//  TuesdayHomework
//
//  Created by Andy Malik on 3/8/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import "HomeViewController.h"
#import "AddressBook.h"
#import "Contact.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AddressBook *myAddressBook = [[AddressBook alloc]initWithName:@"Andy's Book"];
    
    [myAddressBook makeContact:@"Andy Malik" andEmail:@"me@andymalik.com"];
    [myAddressBook makeContact:@"Allen Hurst" andEmail:@"him@allenhurst.com"];
    
    NSLog(@"%lu", [myAddressBook entries]);
    
    for (Contact *contact in [myAddressBook contacts]) {
        NSLog(@"%@", [contact name]);
        NSLog(@"%@", [contact email]);
    }
    
    [myAddressBook release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
