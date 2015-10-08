//
//  Note.h
//  
//
//  Created by JGabrielFreitas on 06/10/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Note : NSManagedObject

- (NSString*) showObjectAsString;
- (void) save;
- (void) deleteNote;
- (NSString*) dateAsString;

@end

NS_ASSUME_NONNULL_END

#import "Note+CoreDataProperties.h"
