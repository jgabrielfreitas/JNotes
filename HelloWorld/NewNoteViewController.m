//
//  NewNoteViewController.m
//  JGabrielFreitas
//
//  Created by JGabrielFreitas on 06/10/15.
//  Copyright © 2015 JGabrielFreitas. All rights reserved.
//

#import "NewNoteViewController.h"
#import "Note.h"
#import "MagicalRecord.h"

@interface NewNoteViewController ()

@property (weak, nonatomic) IBOutlet UITextField *noteTextField;
@property (weak, nonatomic) IBOutlet UITextField *titleNoteTextField;

@end


@implementation NewNoteViewController

@synthesize note;

UITapGestureRecognizer *tap;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // Create and initialize a tap gesture
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(respondToTapGesture)];
    
    // Add the tap gesture recognizer to the view
    [self.view addGestureRecognizer:tapRecognizer];
    
    
    if (self.note != nil) {
        self.titleNoteTextField.text = note.title;
        self.noteTextField.text      = note.note;
    }
    
}


// method called by framework
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
}


// close keyboard
-(void) respondToTapGesture {
    [self.view endEditing:YES];
}


// method called when 'Salvar' button was clicked
- (IBAction)saveNoteDidTouch:(id)sender {
    
    // validate TextFields
    if([self.titleNoteTextField.text isEqualToString:@""]) {
        NSLog(@"title is null");
        return;
    }
    
    if([self.noteTextField.text isEqualToString:@""]) {
        NSLog(@"note is null");
        return;
    }
    
    // if no note was passed
    if(self.note == nil) {
        
        // create note using MagicalRecord
        self.note = [Note MR_createEntity];
        self.note.title = self.titleNoteTextField.text;
        self.note.note  = self.noteTextField.text;
        self.note.currentDate = [NSDate date];
    
    } else { // if has a note, just update him
        
        self.note.title = self.titleNoteTextField.text;
        self.note.note  = self.noteTextField.text;
    }
    
    // save it and close ViewController
    [self.note save];
    
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
