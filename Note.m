//
//  Note.m
//  
//
//  Created by JGabrielFreitas on 06/10/15.
//
//

#import "Note.h"
#import "MagicalRecord.h"

@implementation Note

-(NSString *)showObjectAsString {
    
    return [NSString stringWithFormat:@"Note object: title - %@, note - %@, date - %@", self.title, self.note, self.dateAsString];
}

-(void)save {
    
    
    NSString *objectToString =[self showObjectAsString];
    NSLog(@"Saving: %@", objectToString);
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

-(void)deleteNote {
    [self MR_deleteEntity];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

-(NSString *)dateAsString {

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ; // here we create NSDateFormatter object for change the Format of date..
    [dateFormatter setDateFormat:@"yyyy-MM-dd"]; // here set format of date which is in your output date (means above str with format)
    
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];// here set format which you want...
    NSString *convertedString = [dateFormatter stringFromDate:self.currentDate]; //here convert date in NSString
    
    return convertedString;
}

@end
