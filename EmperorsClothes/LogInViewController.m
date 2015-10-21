//
//  LogInViewController.m
//  EmperorsClothes
//
//  Created by Michael Sevy on 10/11/15.
//  Copyright © 2015 Michael Sevy. All rights reserved.
//

#import "LogInViewController.h"
#import <Parse/Parse.h>
#import "ViewController.h"

@interface LogInViewController ()<UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.username.delegate = self;
    self.password.delegate = self;

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

//    [self.navigationController.navigationBar setHidden:YES];
    
}


- (IBAction)onLogInTapped:(UIButton *)sender {

    NSString *username = [self.username.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.password.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    if ([username length] == 0 || [password length] == 0) {
        //alert controller
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Please complete both username and password" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    } else{
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error){
            if (error) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Username or Password is incorrect" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

                }];
                [alert addAction:action];
                [self presentViewController:alert animated:YES completion:nil];
            } else{
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];

    return  YES;
}


//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}


@end
