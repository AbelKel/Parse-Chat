//
//  RegistrationViewController.m
//  Parse Chat
//
//  Created by Abel Kelbessa on 6/26/22.
//

#import "RegistrationViewController.h"
#import <Parse/Parse.h>
#import "AppDelegate.h"
#import "LoginViewController.h""

@interface RegistrationViewController ()

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)registerAction:(id)sender {
    [self registerUser];
}

- (void)registerUser {
    PFUser *newUser = [PFUser user];
    
    newUser.username = self.registrationUsername.text;
    newUser.email = self.registrationEmail.text;
    newUser.password = self.registrationPassword.text;
    
    NSLog(@"%@", newUser.username);
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if ([self.registrationUsername.text isEqual:@""]) {
            NSLog(@"no input");
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Missing input" message:@"Please fill in username and password" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alert addAction:cancelAction];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alert addAction:okAction];
            [self presentViewController:alert animated:YES completion:nil];
            
//            [self presentViewController:alert animated:YES completion:^{
//                [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES
//                                                                                           completion:^{
//   
//                                                                                           }];
//            }];
        }

        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        } else {
            NSLog(@"User registered successfully");
        }
    }];
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    UIViewController *registertion = sender;
//    PFUser *userToPass = self.newUser;
//    LoginViewController *LoginVC = [segue destinationViewController];
//    LoginVC.registeredUser = userToPass;
//}



@end
