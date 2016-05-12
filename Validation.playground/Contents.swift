
import UIKit
import CoreData

let property = NSAttributeDescription()
property.name = "property"
property.attributeType = .DateAttributeType

let entity = NSEntityDescription()
entity.name = "Entity"
entity.properties = [property]

let model = NSManagedObjectModel()
model.entities = [entity]

let storeCoordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
try! storeCoordinator.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil)

let context = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
context.persistentStoreCoordinator = storeCoordinator

let object = NSEntityDescription.insertNewObjectForEntityForName(entity.name!, inManagedObjectContext: context)



do {
	var string: AnyObject? = ""
	try object.validateValue(&string, forKey: property.name)
	print("Valid")
} catch {
	print(error)
}
