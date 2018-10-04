#import "UserProfileViewController.h"

@interface UserProfileViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textFieldUserData;

@end

@implementation UserProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [OAuthManager sharedInstnace].delegate = self;
    [[OAuthManager sharedInstnace] oAuthManagerUserData];
    
#ifdef OAuth_LOG_MANAGER
   NSLog(@"\nUserProfileViewController Login Oauth Type == %@",[[OAuthManager sharedInstnace] getOAuthgetLoginName]);
#endif
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getOAuthManagerUserData:(NSString *)userData{
    dispatch_async(dispatch_get_main_queue(), ^{
            [self.textFieldUserData setText:userData];
    });
}

- (IBAction)actionLogout:(id)sender {
    [[OAuthManager sharedInstnace] oAuthManagerLogout];
}

- (IBAction)actionOAuthDelete:(id)sender {
    [[OAuthManager sharedInstnace] oAuthManagerDelete];
}
    
    
- (void)responseLogoutResult:(BOOL)state{
     [self.navigationController popViewControllerAnimated:state];
}
@end
