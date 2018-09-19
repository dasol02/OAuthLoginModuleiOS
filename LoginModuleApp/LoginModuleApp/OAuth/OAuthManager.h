#import <NaverThirdPartyLogin/NaverThirdPartyLogin.h>

@protocol OAuthManagerDelegate<NSObject>
@optional
- (void)getOAuthManagerLoginState:(BOOL)loginState;
- (void)getOAuthManagerUserData:(NSString *)userData;
@end
@interface OAuthManager : NSObject<NaverThirdPartyLoginConnectionDelegate>
@property (strong, nonatomic) NaverThirdPartyLoginConnection *thirdPartyLoginConn;
@property (weak, nonatomic) id<OAuthManagerDelegate> delegate;

+ (OAuthManager *)sharedInstnace;

- (void)oAuthManagerLoginState;
- (void)oAuthManagerUserData;

- (void)oAuthManagerLogout;
- (void)oAuthManagerDelete;
- (void)oAuthManagerRefreshToken;
- (NSArray*)oAUthManagerGetAccessToken;

#pragma mark- NAVER OAuth
- (void) requestThirdpartyLogin;

@end
