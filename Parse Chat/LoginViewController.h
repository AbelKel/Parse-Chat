//
//  LoginViewController.h
//  Parse Chat
//
//  Created by Abel Kelbessa on 6/25/22.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController
@property (nonatomic) PFUser *registeredUser;
@end

NS_ASSUME_NONNULL_END
