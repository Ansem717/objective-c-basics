//
//  AddViewController.m
//  ClassRoster
//
//  Created by Andy Malik on 3/9/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import "AddViewController.h"
#import "Student.h"
#import "StudentStorage.h"
#import "Student+Additions.h"

#pragma mark - Extension
@interface AddViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstNameInputArea;
@property (weak, nonatomic) IBOutlet UITextField *lastNameInputArea;
@property (weak, nonatomic) IBOutlet UITextField *emailInputArea;
@property (weak, nonatomic) IBOutlet UITextField *phoneInputArea;

@property (strong, nonatomic) Student *student;

- (IBAction)saveButtonPressed:(UIButton *)sender;

@end

#pragma mark - Implementation
@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

+ (NSString *)identifier {
    return NSStringFromClass(self);
}

- (Student *)student {
    if (!_student) {
        _student = [[Student alloc]initWithFirstName:@""
                                         andLastName:@""
                                            andEmail:@""
                                      andPhoneNumber:@""];
    }
    
    return _student;
}

- (void)showAlertView {
    NSString *title = @"Hold up!";
    NSString *message = @"Please fill out all required information";
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title message:message preferredStyle: UIAlertControllerStyleAlert];
    
    [controller addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:controller animated:YES completion:nil];
    
}

- (IBAction)saveButtonPressed:(UIButton *)sender {
    self.student.firstName = self.firstNameInputArea.text;
    self.student.lastName = self.lastNameInputArea.text;
    self.student.email = self.emailInputArea.text;
    self.student.phoneNumber = self.emailInputArea.text;
    
    if (self.student.isValidStudent) {
        [[StudentStorage shared]add:self.student];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

@end
