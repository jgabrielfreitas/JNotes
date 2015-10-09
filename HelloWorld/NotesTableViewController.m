//
//  NotesTableViewController.m
//  JGabrielFreitas
//
//  Created by JGabrielFreitas on 05/10/15.
//  Copyright © 2015 JGabrielFreitas. All rights reserved.
//

#import "NotesTableViewController.h"
#import "MagicalRecord.h"
#import "Note.h"
#import "NewNoteViewController.h"

@interface NotesTableViewController ()

@end

@implementation NotesTableViewController

NSMutableArray *allNotes;
Note *selectedNote;


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.tableView.delegate = self;    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated {
    // show navigation item
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    [self.navigationItem setHidesBackButton:YES];
    
    NSArray *allNotesArray = [Note MR_findAll];
    allNotes = [allNotesArray mutableCopy];
    
    [self.tableView reloadData];
}

#pragma mark - popule table view controller
// say the numbers of rows
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return allNotes.count;
}

// detect 'delete' button in tableviewcontroller
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // Delete the row from the data source
        Note *noteToDelete = [allNotes objectAtIndex:indexPath.row];
        [noteToDelete deleteNote];
        
        // Remove the row from data model
        [allNotes removeObjectAtIndex:indexPath.row];
        
        // capture selected row
        UITableViewCell *currentCell = [self.tableView cellForRowAtIndexPath:indexPath];

        // Launch reload for the two index path
        [self.tableView deleteRowsAtIndexPaths:@[[self.tableView indexPathForCell:currentCell]] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // define cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    UILabel *title = (UILabel *) [cell viewWithTag:1];
    title.text = [allNotes[indexPath.row] title];

    UILabel *currentDate = (UILabel *) [cell viewWithTag:2];
    currentDate.text = [allNotes[indexPath.row] dateAsString];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    selectedNote = [allNotes objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"NewNoteSegue" sender:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NewNoteViewController *newNoteViewController = segue.destinationViewController;
    newNoteViewController.note = selectedNote;
    selectedNote = nil;
}
@end














