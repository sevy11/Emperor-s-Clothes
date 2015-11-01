//
//  SignUpVC.m
//  EmperorsClothes
//
//  Created by Michael Sevy on 10/11/15.
//  Copyright © 2015 Michael Sevy. All rights reserved.
//
#import "SignUpVC.h"
#import "LogInViewController.h"
#import <Parse/Parse.h>



@interface SignUpVC ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *email;

@end

@implementation SignUpVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.username.delegate = self;
    self.password.delegate = self;
    self.email.delegate = self;

}




- (IBAction)signUp:(UIButton *)sender {
    //check's to make sure there is no white space in uitextfield
    NSString *username = [self.username.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.password.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *email = [self.email.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    if ([username length] == 0 || [password length] == 0 || [email length] == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Make sure you enter a Username, Password, and Email Address" preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        }];

        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];

    } else  {

        PFUser *newUser = [PFUser user];
        newUser.username = username;
        newUser.password = password;
        newUser.email = email;

        //asunchronouly sends Parse the user data if no errors between ios and server, uses block of code to do this
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
            if (error) {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry!" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];

                [alert show];
            } else {
                [self.navigationController popToRootViewControllerAnimated:YES];

            }
        }];

    }
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}




@end



