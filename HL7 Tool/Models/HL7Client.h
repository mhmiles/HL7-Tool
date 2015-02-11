//
//  HL7MLLPClient.h
//  HL7 Tool
//
//  Created by Miles Hollingsworth on 5/15/13.
//  Copyright (c) 2013 Miles Hollingsworth. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HL7ClientDelegate;

@interface HL7Client : NSObject <NSStreamDelegate>

@property (weak, nonatomic) id <HL7ClientDelegate> delegate;

+ (instancetype)clientWithServer:(NSString *)server andPort:(NSString *)port;
- (void) sendMessage:(NSString *)messsageString;

@end

@protocol HL7ClientDelegate <NSObject>

- (void)client:(HL7Client *)sender didReachResult:(NSString *)resultString;

@end