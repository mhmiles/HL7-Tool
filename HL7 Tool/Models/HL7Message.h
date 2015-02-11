//
//  HL7Message.h
//  HL7 Tester
//
//  Created by Miles Hollingsworth on 5/13/13.
//  Copyright (c) 2013 Miles Hollingsworth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HL7Message : NSObject

+ (instancetype)messageWithString:(NSString *)aString;
- (const void *)bytes;
- (NSUInteger)length;

@end
