//
//  RegistrationViewController.h
//  Parse Chat
//
//  Created by Abel Kelbessa on 6/26/22.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

NS_ASSUME_NONNULL_BEGIN

@interface RegistrationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *registrationUsername;
@property (weak, nonatomic) IBOutlet UITextField *registrationEmail;
@property (weak, nonatomic) IBOutlet UITextField *registrationPassword;
//@property (nonatomic) PFUser *newUser1;

@end

NS_ASSUME_NONNULL_END
