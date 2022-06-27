//
//  ChatCell.h
//  Parse Chat
//
//  Created by Abel Kelbessa on 6/26/22.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

NS_ASSUME_NONNULL_BEGIN



@interface ChatCell : UITableViewCell

@property (strong, nonatomic) PFUser *user;
@property (weak, nonatomic) IBOutlet UILabel *messageContent;

@end

NS_ASSUME_NONNULL_END
