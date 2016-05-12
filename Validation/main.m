
@import Foundation;
@import CoreData;

int main(int argc, const char * argv[]) {
	@autoreleasepool {

		NSAttributeDescription *property = [NSAttributeDescription new];
		property.name = @"property";
		property.attributeType = NSDateAttributeType;

		NSEntityDescription *entity = [NSEntityDescription new];
		entity.name = @"Entity";
		entity.properties = @[property];

		NSManagedObjectModel *model = [NSManagedObjectModel new];
		model.entities = @[entity];

		NSPersistentStoreCoordinator *storeCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
		[storeCoordinator addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:nil];

		NSManagedObjectContext *context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
		context.persistentStoreCoordinator = storeCoordinator;

		NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:entity.name inManagedObjectContext:context];

		NSString *string = @"";
		NSError *error = nil;
		BOOL valid = [object validateValue:&string forKey:property.name error:&error];
		if (valid) {
			NSLog(@"Valid");
		} else {
			NSLog(@"%@", error);
		}
	}

    return 0;
}
