//
//  menuViewController.m
//  f-iOS-UIAnimations
//
//  Created by Jorge Mendoza on 12/27/11.
//  Copyright (c) 2011 Code Fuel C.A. All rights reserved.
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


#import "menuViewController.h"

@implementation menuViewController
@synthesize tView;
@synthesize dataSource;
@synthesize delegate;

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString * stringValue = @"";
    
    switch (section) {
        case 0:
        {
            stringValue = @"";
            break;
        }
        case 1:
        {
            stringValue = @"Favorites"; 
            break;
        }
        case 2:
        {
            stringValue = @"Groups"; 
            break;
        }
    }
    return stringValue;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [dataSource count];
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[dataSource objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *MyIdentifier = @"MyIdentifier";
	
	UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:MyIdentifier] autorelease];
    }//if cell is nil

    cell.textLabel.text = [[dataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    if( [cell.textLabel.text isEqualToString:@"User's Profile Name"])
    {
        cell.imageView.image = [UIImage imageNamed:@"meme-pic.png"];
    }
    else if( [cell.textLabel.text isEqualToString:@"News Feed"])
    {
        cell.imageView.image = [UIImage imageNamed:@"news-big.png"];
    }
    else if( [cell.textLabel.text isEqualToString:@"Messages"])
    {
        cell.imageView.image = [UIImage imageNamed:@"fb-mess.png"];
    }
    else if( [cell.textLabel.text isEqualToString:@"Nearby"])
    {
        cell.imageView.image = [UIImage imageNamed:@"check-in-fb-btn2.png"];
    }
    else if( [cell.textLabel.text isEqualToString:@"Events"])
    {
        cell.imageView.image = [UIImage imageNamed:@"cal-fb.png"];
    }
    else if( [cell.textLabel.text isEqualToString:@"Friends"])
    {
        cell.imageView.image = [UIImage imageNamed:@"users-2.png"];
    }
    else
    {
        cell.imageView.image = [UIImage imageNamed:@"pile-fb.png"];
    }
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:12];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [delegate changeLabelText:[[dataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    [delegate hideMenuFromView];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    dataSource =  [[NSMutableArray alloc]init];
    
    NSMutableArray * userProfile = [[NSMutableArray alloc]init];
    NSMutableArray * userFavorites = [[NSMutableArray alloc]init];
    NSMutableArray * userGroups = [[NSMutableArray alloc]init];
    
    [userProfile addObject:@"User's Profile Name"];
    
    [userFavorites addObject:@"News Feed"];
    [userFavorites addObject:@"Messages"];
    [userFavorites addObject:@"Nearby"];
    [userFavorites addObject:@"Events"];
    [userFavorites addObject:@"Friends"];
    
    [userGroups addObject:@"Group 1"];
    [userGroups addObject:@"Group 2"];
    [userGroups addObject:@"Group 3"];
    [userGroups addObject:@"Group 4"];
    [userGroups addObject:@"Group 5"];
    
    [dataSource addObject:userProfile];
    [dataSource addObject:userFavorites];
    [dataSource addObject:userGroups];
    
    [userProfile release];
    [userFavorites release];
    [userGroups release];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [dataSource release];
    [tView release];
    [super dealloc];
}

@end
