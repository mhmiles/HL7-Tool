//
//  HL7.m
//  HL7 Tester
//
//  Created by Miles Hollingsworth on 5/13/13.
//  Copyright (c) 2013 Miles Hollingsworth. All rights reserved.
//

#import "HL7WindowController.h"
#import "HL7Message.h"
#import "HL7Client.h"

@interface HL7WindowController ()

@property (strong, nonatomic) HL7Client *client;

- (void)startProgressIndicator;
- (void)stopProgressIndicator;

@end

@implementation HL7WindowController

- (IBAction)sendMessage:(id)sender
{
    self.client = [HL7Client clientWithServer:[self.serverTextField stringValue] andPort:[self.portTextField stringValue]];
    
    if (!self.client) {
        [self.resultTextView setString:@"Invalid host"];
        return;
    }
    
    [self.sendButton setEnabled:NO];
    [self startProgressIndicator];
    
    self.client = [HL7Client clientWithServer:[self.serverTextField stringValue] andPort:[self.portTextField stringValue]];
    self.client.delegate = self;
    [self.client sendMessage:[self.messageTextView string]];
}

- (void)startProgressIndicator {
    [self.progressIndicator startAnimation:self];
    [self.progressIndicator setHidden:NO];
}

- (void)stopProgressIndicator {
    [self.progressIndicator setHidden:YES];
    [self.progressIndicator stopAnimation:self];
}

#pragma mark HL7ClientDelegate methods

- (void)client:(HL7Client *)sender didReachResult:(NSString *)resultString {
    [self stopProgressIndicator];
    [self.resultTextView setString:[resultString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
    [self.sendButton setEnabled:YES];
}

@end