//
//  UserCreadintial+CoreDataProperties.h
//  
//
//  Created by satish on 28/01/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "UserCreadintial.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserCreadintial (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSString *lastName;
@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSString *phoneNumber;
@property (nullable, nonatomic, retain) NSString *passWord;

@end

NS_ASSUME_NONNULL_END
