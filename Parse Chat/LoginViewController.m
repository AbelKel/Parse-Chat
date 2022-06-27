//
//  LoginViewController.m
//  Parse Chat
//
//  Created by Abel Kelbessa on 6/25/22.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *singUpButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)loginAction:(id)sender {
    [self loginUser];
}


- (void)loginUser {
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if ([self.usernameField.text isEqual:@""]) {
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
            NSLog(@"User log in failed: %@", error.localizedDescription);

        } else {
            NSLog(@"User logged in successfully");
            //[self performSegueWithIdentifier:@"transitionToNav" sender:nil];
            
            // display view controller that needs to shown after successful login
        }
    }];
}



@end
