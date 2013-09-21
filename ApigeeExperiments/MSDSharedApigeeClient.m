//
//  MSDSharedApigeeClient.m
//  ApigeeExperiments
//
//  Created by Matthew Dobson on 9/20/13.
//  Copyright (c) 2013 Matthew Dobson. All rights reserved.
//

#import "MSDSharedApigeeClient.h"
#import <ApigeeiOSSDK/ApigeeClient.h>

@implementation MSDSharedApigeeClient

static ApigeeClient * client = nil;
static NSString *org;
static NSString *app;

+(void)initWithOrg:(NSString *)organization andApp:(NSString *)application {
    org = organization;
    app = application;
    client = [[ApigeeClient alloc] initWithOrganizationId:org applicationId:app];
}

+(ApigeeDataClient *)sharedClient {
    return [client dataClient];
}

@end
