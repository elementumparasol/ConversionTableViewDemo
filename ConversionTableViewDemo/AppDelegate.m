//
//  AppDelegate.m
//  ConversionTableViewDemo
//
//  Created by Nate Chandler on 10/29/12.
//  Copyright (c) 2012 Nate Chandler. All rights reserved.
//


#import "AppDelegate.h"
#import "MainWindowController.h"

@interface AppDelegate ()
@property (nonatomic, strong, readwrite) MainWindowController *mainWindowController;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
	self.mainWindowController = [[MainWindowController alloc] init];
	[self.mainWindowController showWindow:nil];
}

@end
