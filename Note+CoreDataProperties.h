//
//  Note+CoreDataProperties.h
//  
//
//  Created by JGabrielFreitas on 06/10/15.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Note.h"

NS_ASSUME_NONNULL_BEGIN

@interface Note (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *note;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSDate *currentDate;

@end

NS_ASSUME_NONNULL_END
