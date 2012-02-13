//
//  ViewController.m
//  curledViews
//
//  Created by Ryan Kelly on 2/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+Curled.h"
#import "UIImageView+Curled.h"

@implementation ViewController
@synthesize photoButton;
@synthesize photoImageView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setPhotoButton:nil];
    [self setPhotoImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    // configure images and border for a Custom UIButton
    [photoButton setContentMode:UIViewContentModeScaleToFill];
    [photoButton setImage:[UIImage imageNamed:@"raptor_face.png"] borderWidth:5.0 shadowDepth:10.0 controlPointXOffset:30.0 controlPointYOffset:70.0 forState:UIControlStateNormal];
    [photoButton setImage:[UIImage imageNamed:@"stegasaurus_face.png"] borderWidth:5.0 shadowDepth:10.0 controlPointXOffset:30.0 controlPointYOffset:70.0 forState:UIControlStateHighlighted];
    
    
    // configure images and border for a UIImageView
    [photoImageView setContentMode:UIViewContentModeScaleToFill];
    [photoImageView setImage:[UIImage imageNamed:@"stegasaurus_face.png"] borderWidth:5.0 shadowDepth:10.0 controlPointXOffset:30.0 controlPointYOffset:70.0];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
