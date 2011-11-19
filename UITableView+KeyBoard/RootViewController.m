//
//  RootViewController.m
//  UITableView+KeyBoard
//
//  Created by Jorge Mendoza on 11/19/11.
//  Copyright 2011 Code Fuel All rights reserved.
//  http://www.codefuel.me
//  Tw: @jorgevmendoza

// The MIT License (MIT)
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software 
// and associated documentation files (the "Software"), to deal in the Software without restriction,
// including without limitation the rights to use, copy, modify, merge, publish, distribute, 
// sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is 
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all copies or 
// substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT 
// NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND 
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
// DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "RootViewController.h"
#import "CustomTextBoxCell.h"

@implementation RootViewController

@synthesize dataSource;

- (void)viewDidLoad
{
    self.navigationController.navigationBarHidden = YES;
    
     dataSource = [[NSMutableArray alloc]init];
    
    [dataSource addObject:@"Field 1"];
    [dataSource addObject:@"Field 2"];
    [dataSource addObject:@"Field 3"];
    [dataSource addObject:@"Field 4"];
    [dataSource addObject:@"Field 5"];
    [dataSource addObject:@"Field 6"];
    [dataSource addObject:@"Field 7"];
    [dataSource addObject:@"Field 8"];
    [dataSource addObject:@"Field 9"];
    [dataSource addObject:@"Field 10"];
    [dataSource addObject:@"Field 11"];
    [dataSource addObject:@"Field 12"];
    [dataSource addObject:@"Field 13"];
    [dataSource addObject:@"Field 14"];
    
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    static NSString *CellIdentifier = @"UICustomNewsCell";
    
    CustomTextBoxCell *cell = (CustomTextBoxCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
	if (cell == nil) { 
		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomTextBoxCell"
													 owner:self options:nil];
		for (id oneObject in nib) if ([oneObject isKindOfClass:[CustomTextBoxCell class]])
			cell = (CustomTextBoxCell *)oneObject;
	} 
    
    cell.textField.delegate = self;
    
    cell.textField.placeholder = [dataSource objectAtIndex:indexPath.row];
    
    cell.label.text = [dataSource objectAtIndex:indexPath.row];
    
	return cell;
}

- (void) animateView: (BOOL) up
{
    CGRect rect = self.view.frame;
    
    if(up)
    {
        float movement = (up ? 264 : 416);
        rect.size.height = movement;
        self.view.frame = rect;
    }
    else
    {
        rect.size.height = 480;
        self.view.frame = rect;
    }
}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    
    [self animateView:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)dealloc
{
    [dataSource release];
    [super dealloc];
}

@end
