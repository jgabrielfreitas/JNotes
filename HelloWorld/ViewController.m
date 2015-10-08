//
//  ViewController.m
//  JNotes
//
//  Created by JGabrielFreitas on 05/10/15.
//  Copyright © 2015 JGabrielFreitas. All rights reserved.
//

#import "ViewController.h"
#import "MagicalRecord.h"
#import "Note.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

// action called when 'Next' button was clicked by user
- (IBAction)nextButtonDidTouch:(id)sender {
    
    
}

-(void)viewWillAppear:(BOOL)animated {
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
}

@end
