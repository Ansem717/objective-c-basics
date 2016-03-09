//
//  ViewController.m
//  ClassRoster
//
//  Created by Andy Malik on 3/9/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "StudentStorage.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Student *randomStudent = [[Student alloc] initWithFirstName:@"Andy" andLastName:@"Malik" andEmail:@"me@andymalik.com" andPhoneNumber:@"206.304.6909"];
    
    [[StudentStorage shared]add:randomStudent];
    
    NSLog(@"%@", [[StudentStorage shared]allStudents]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}


#pragma mark - TableView Functions
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[StudentStorage shared]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *studentCell = [tableView dequeueReusableCellWithIdentifier:@"studentCell" forIndexPath:indexPath];
    
    Student *student = [[StudentStorage shared]studentForIndexPath:indexPath];
    
    studentCell.textLabel.text = student.firstName;
    studentCell.detailTextLabel.text = [NSString stringWithFormat:@"Phone: %@", student.phoneNumber];
    
    return studentCell;
}


@end
