#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"

#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

// 引入 JPush 功能所需头文件
#import "JPUSHService.h"
// iOS10 注册 APNs 所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif
// 如果需要使用 idfa 功能所需要引入的头文件（可选）
#import <AdSupport/AdSupport.h>

@interface AppDelegate ()<JPUSHRegisterDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //  申请推送通知权限
    [self requestNotification:launchOptions];
    [GeneratedPluginRegistrant registerWithRegistry:self];

    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

-(void) requestNotification :(NSDictionary *)launchOptions
{
    if (@available(iOS 10, *))
    {
        UNUserNotificationCenter * center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
        [center requestAuthorizationWithOptions:UNAuthorizationOptionAlert | UNAuthorizationOptionBadge | UNAuthorizationOptionSound completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (granted) {
                // 允许推送
                NSLog(@"允许推送");
            }else{
                //不允许
                [self showAlrtToSetting];
            }
            
        }];
    }
    else if(@available(iOS 8 , *))
    {
        UIApplication * application = [UIApplication sharedApplication];
        
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil]];
        [application registerForRemoteNotifications];
    }
    else
    {
        UIApplication * application = [UIApplication sharedApplication];
        [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound];
        [application registerForRemoteNotifications];
    }
}

#pragma mark 没权限的弹窗
-(void) showAlrtToSetting
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"您还没有允许****权限" message:@"去设置一下吧" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction * setAction = [UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([[UIApplication sharedApplication] canOpenURL:url]) {
                [[UIApplication sharedApplication] openURL:url];
            }
        });
        
    }];
    
    [alert addAction:cancelAction];
    [alert addAction:setAction];
    
    [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
}
// 将得到的deviceToken传给SDK
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
   
    
    [JPUSHService registerDeviceToken:deviceToken];
}
@end
