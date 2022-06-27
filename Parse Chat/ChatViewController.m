//
//  ChatViewController.m
//  Parse Chat
//
//  Created by Abel Kelbessa on 6/26/22.
//

#import "ChatViewController.h"
#import <Parse/Parse.h>
#import "ChatCell.h"


@interface ChatViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic) PFObject *userMessage;
@property (weak, nonatomic) IBOutlet UITextField *message;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *chatMessages;
//@property (weak, nonatomic) IBOutlet UILabel *displayChat;
//@property (weak, nonatomic) IBOutlet UILabel *messageContent;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self onTimer];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Message_FBU2021"];
    query.limit = 20;
    [query orderByDescending:@"createdAt"];
    
    
    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            [self.tableView reloadData];
            self.chatMessages = posts;
            NSLog(@"Working");
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
    
}

- (void)onTimer {
    [self.tableView reloadData];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTimer) userInfo:nil repeats:true];

}

- (IBAction)loginToAccount:(id)sender {
    //transitionToNav
    //[self performSegueWithIdentifier:@"transitionToNav" sender:nil];
}
- (IBAction)sendButton:(id)sender {
    PFObject *userMessage = [PFObject objectWithClassName:@"Message_FBU2021"];
    userMessage[@"text"] = self.message.text;
    [userMessage saveInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (succeeded) {
            NSLog(@"%@", self.chatMessages);
            self.message.text = nil;
        } else {
            NSLog(@"Problem saving message: %@", error.localizedDescription);
        }
    }];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.chatMessages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ChatCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChatCell" forIndexPath:indexPath];
    cell.user = self.chatMessages[indexPath.row];
    cell.messageContent.text = self.chatMessages[indexPath.row][@"text"];
    return cell;
    
}



@end
