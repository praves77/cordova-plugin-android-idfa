#import <AdSupport/AdSupport.h>
#import <Cordova/CDV.h>

@interface AndroidIDFA : CDVPlugin

- (void)getAdId:(CDVInvokedUrlCommand*)command;

- (void)getIDFV:(CDVInvokedUrlCommand*)command;

- (void)getLimitAd:(CDVInvokedUrlCommand*)command;

- (void)getAdInfo:(CDVInvokedUrlCommand*)command;

@end