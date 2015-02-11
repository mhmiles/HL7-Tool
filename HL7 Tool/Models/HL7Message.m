//
//  HL7Message.m
//  HL7 Tester
//
//  Created by Miles Hollingsworth on 5/13/13.
//  Copyright (c) 2013 Miles Hollingsworth. All rights reserved.
//

#import "HL7Message.h"

@interface HL7Message ()

@property (strong, nonatomic) NSString *messageString;

@end

@implementation HL7Message

+ (instancetype)messageWithString:(NSString *)messageString {
    HL7Message *message = [[HL7Message alloc] init];
    message.messageString = [NSString stringWithFormat:@"\x0B%@\x1C\x0D", [messageString stringByReplacingOccurrencesOfString:@"\n" withString:@"\r"]];
    
    return message;
}

- (const void *)bytes {
    return [[self.messageString dataUsingEncoding:NSUTF8StringEncoding] bytes];
}

- (NSUInteger)length {
    return [self.messageString length]+1;
}

@end
