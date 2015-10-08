//
//  NewNoteViewController.h
//  JGabrielFreitas
//
//  Created by JGabrielFreitas on 06/10/15.
//  Copyright © 2015 JGabrielFreitas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"

@interface NewNoteViewController : UIViewController

// create Note here to pass between the views controllers
@property (weak, nonatomic) Note *note;

@end

