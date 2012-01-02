//
//  mainViewController.m
//  f-iOS-UIAnimations
//
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


#import "mainViewController.h"


@implementation mainViewController
@synthesize controlsView;
@synthesize isHidden;
@synthesize sectionLabel;

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
    isHidden = NO;
    controlsView.backgroundColor = [UIColor clearColor];
    sectionLabel.text = @"Here goes the text from the menu";
    
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

- (IBAction)showHideMenu {
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.3];
	
    if (isHidden) {
        self.view.frame = CGRectMake(0, 0, 320, 480);
		isHidden = NO;
	}
	else {
		self.view.frame = CGRectMake(260, 0, 320, 480);
		isHidden = YES;
	}
	[UIView commitAnimations];
}

- (void)hideMenuFromView {
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.3];
    self.view.frame = CGRectMake(0, 0, 320, 480);
    isHidden = NO;
	[UIView commitAnimations];
}

-(void)changeLabelText:(NSString *)section
{
    sectionLabel.text = section;
}

- (void)dealloc {
    [controlsView release];
    [super dealloc];
}

@end
