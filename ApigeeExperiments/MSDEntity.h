//
//  MSDEntity.h
//  ApigeeExperiments
//
//  Created by Matthew Dobson on 9/20/13.
//  Copyright (c) 2013 Matthew Dobson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ApigeeiOSSDK/ApigeeEntity.h>

@interface MSDEntity : ApigeeEntity

typedef void (^ ResponseBlock)(NSError*, MSDEntity*);

-(void) saveWithCompletion:(ResponseBlock)block;

-(id) initWithType:(NSString*)type andDictionary:(NSDictionary*)dict;

-(id) initWithType:(NSString*)type;


@end
