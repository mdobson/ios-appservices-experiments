//
//  MSDSharedApigeeClient.h
//  ApigeeExperiments
//
//  Created by Matthew Dobson on 9/20/13.
//  Copyright (c) 2013 Matthew Dobson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ApigeeiOSSDK/ApigeeClient.h>


@interface MSDSharedApigeeClient : NSObject

+(ApigeeDataClient *) sharedClient;
+(void)initWithOrg:(NSString*)organization andApp:(NSString*)application;

@end
