//
//  HL7.h
//  HL7 Tester
//
//  Created by Miles Hollingsworth on 5/13/13.
//  Copyright (c) 2013 Miles Hollingsworth. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "HL7Client.h"

@interface HL7WindowController : NSWindowController <HL7ClientDelegate>

@property (strong, nonatomic) IBOutlet NSTextField *serverTextField;
@property (strong, nonatomic) IBOutlet NSTextField *portTextField;
@property (strong, nonatomic) IBOutlet NSTextView *messageTextView;
@property (strong, nonatomic) IBOutlet NSButton *sendButton;
@property (strong, nonatomic) IBOutlet NSTextView *resultTextView;
@property (strong, nonatomic) IBOutlet NSProgressIndicator *progressIndicator;

- (IBAction)sendMessage:(id)sender;

@end
