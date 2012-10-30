//
//  MainWindowController.m
//  ConversionTableViewDemo
//
//  Created by Nate Chandler on 10/29/12.
//  Copyright (c) 2012 Nate Chandler. All rights reserved.
//

#import "MainWindowController.h"

#define MakeQuantity(val) [Quantity quantityWithAbsoluteValue:(val)]

@interface Quantity : NSObject
@property (nonatomic, assign, readwrite) CGFloat absoluteValue;
@property (readwrite) CGFloat valueInUnitA;
@property (readwrite) CGFloat valueInUnitB;
- (CGFloat)valueInUnitB;
+ (Quantity *)quantityWithAbsoluteValue:(CGFloat)absoluteValue;
@end

@implementation Quantity
@synthesize absoluteValue;

static const CGFloat absToA = 3.14159;
static const CGFloat absToB = .141414;

+ (NSSet *)keyPathsForValuesAffectingValueInUnitA
{
	return [NSSet setWithObject:@"absoluteValue"];
}

- (CGFloat)valueInUnitA
{
	return self.absoluteValue * absToA;
}

- (void)setValueInUnitA:(CGFloat)valueInUnitA
{
	self.absoluteValue = valueInUnitA * (1.0f/absToA);
}

+ (NSSet *)keyPathsForValuesAffectingValueInUnitB
{
	return [NSSet setWithObject:@"absoluteValue"];
}

- (CGFloat)valueInUnitB
{
	return self.absoluteValue * absToB;
}

- (void)setValueInUnitB:(CGFloat)valueInUnitB
{
	self.absoluteValue = valueInUnitB * (1.0f/absToB);
}

+ (Quantity *)quantityWithAbsoluteValue:(CGFloat)absoluteValue
{
	Quantity *quantity = [[Quantity alloc] init];
	quantity.absoluteValue = absoluteValue;
	return quantity;
}

@end

@interface MainWindowController ()
@property (nonatomic, strong, readwrite) IBOutlet NSTableView *tableView;
@property (nonatomic, strong, readwrite) NSArray *quantities;
- (IBAction)add:(id)sender;
- (IBAction)remove:(id)sender;
@end

@implementation MainWindowController

- (id)init
{
    self = [super initWithWindowNibName:@"MainWindowController"];
	if (self) {
		self.quantities = @[MakeQuantity(1), MakeQuantity(2), MakeQuantity(3), MakeQuantity(4)];
	}
	return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
}

- (void)add:(id)sender
{
	self.quantities = [self.quantities arrayByAddingObject:MakeQuantity(0)];
}

- (void)remove:(id)sender
{
	if (self.tableView.selectedRow != -1) {
		NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:self.quantities];
		[mutableArray removeObjectAtIndex:self.tableView.selectedRow];
		self.quantities = [mutableArray copy];
	}
}

@end
