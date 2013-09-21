//
//  MSDEntity.m
//  ApigeeExperiments
//
//  Created by Matthew Dobson on 9/20/13.
//  Copyright (c) 2013 Matthew Dobson. All rights reserved.
//

#import "MSDEntity.h"
#import "MSDSharedApigeeClient.h"
#import <ApigeeiOSSDK/ApigeeClientResponse.h>
#import <ApigeeiOSSDK/ApigeeDataClient.h>

@implementation MSDEntity

-(id) initWithType:(NSString *)type {
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

-(id) initWithType:(NSString*)type andDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        NSMutableDictionary *mutableDict = [[NSMutableDictionary alloc] initWithDictionary:dict];
        self.properties = mutableDict;
        self.type = type;
        self.dataClient = [MSDSharedApigeeClient sharedClient];
    }
    return self;
}

-(void)saveWithCompletion:(ResponseBlock)block {
    
    if ([self get:@"uuid"] != nil) {
        ApigeeClientResponse *response = [self save];
        if (response.transactionState == kApigeeClientResponseSuccess) {
            block(nil, self);
        } else {
            NSError *error = [[NSError alloc] initWithDomain:@"apigee" code:[response.errorCode integerValue] userInfo:@{@"errorText":response.errorDescription}];
            block(error, self);
        }
    } else {
        self.properties[@"type"] = self.type;
        [self.dataClient createEntity:self.properties completionHandler:^(ApigeeClientResponse *response){
            if (response.transactionState == kApigeeClientResponseSuccess) {
                block(nil, self);
            } else {
                NSError *error = [[NSError alloc] initWithDomain:@"apigee" code:[response.errorCode integerValue] userInfo:@{@"errorText":response.errorDescription}];
                block(error, self);
            }
        }];
    }
}

@end
