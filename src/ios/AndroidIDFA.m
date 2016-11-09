#import "AndroidIDFA.h"
#import <Cordova/CDV.h>

@implementation AndroidIDFA


// Returns advertisingIdentifier as string
// Will return error on iOS < 6.0 since AdSupport framwork doesn't exist
- (void)getAdId:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;

        // throw error if on iOS < 6.0
        if (NSClassFromString(@"ASIdentifierManager")) {

            NSString *advertiserID = [[(id)[NSClassFromString(@"ASIdentifierManager") sharedManager] advertisingIdentifier] UUIDString];
            
            // have to handle iOS bug where 00000000-0000-0000-0000-000000000000 may be returned on iOS 6.0
            if (advertiserID != nil && [advertiserID length] > 0 && ![advertiserID isEqualToString:@"00000000-0000-0000-0000-000000000000"]) {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:advertiserID];
            }
            
            else {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
            }
        }
        
        else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
    }];
}

// Returns identifierForAdvertising as string
// Will return error on iOS < 6.0 since AdSupport framwork doesn't exist
- (void)getIDFV:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;

        // throw error if on iOS < 6.0
        if (NSClassFromString(@"ASIdentifierManager")) {

            NSString *vendorID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
            
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:vendorID];
        }
        
        else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
    }];
}

// Returns advertisingTrackingEnabled as boolean
// Will return error on iOS < 6.0 since AdSupport framwork doesn't exist
- (void)getLimitAdFlag:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        if (NSClassFromString(@"ASIdentifierManager")) {

            BOOL enabled = [[NSClassFromString(@"ASIdentifierManager") sharedManager] isAdvertisingTrackingEnabled];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:!enabled];

            NSDictionary *data = @{@"limitAd" : [NSNumber numberWithBool:!enabled]};
        
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:data];

        } else {

            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];

        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        
    }];
}

// Returns dictionary containing idfa and tracking enabled bool
// Will return error on iOS < 6.0 since AdSupport framwork doesn't exist
- (void)getAdInfo:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        // throw error if on iOS < 6.0
        if (NSClassFromString(@"ASIdentifierManager")) {
        
            NSString *advertiserID = [[(id)[NSClassFromString(@"ASIdentifierManager") sharedManager] advertisingIdentifier] UUIDString];

            NSString *vendorID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
            
            BOOL enabled = [[NSClassFromString(@"ASIdentifierManager") sharedManager] isAdvertisingTrackingEnabled];
            
            // have to handle iOS bug where 00000000-0000-0000-0000-000000000000 may be returned on iOS 6.0
            // set advertiserID to an empty string 
            if ([advertiserID isEqualToString:@"00000000-0000-0000-0000-000000000000"]) {
                advertiserID = @"";
            }
            
            NSDictionary *adData = @{
                                     @"idfa" : advertiserID,
                                     @"idfv" : vendorID,
                                     @"limitAd" : [NSNumber numberWithBool:!enabled]
            };
        
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:adData];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        
    }];
}
@end