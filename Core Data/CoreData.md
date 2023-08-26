# Core Data
Core Data allows store data on the device locally and retrieve it later.
Core Data is an object graph and persistence framework. It allows data organized by the relational entity–attribute model to be serialized into XML, binary, or SQLite stores.

Core Data is based on `SQLite`.
Core Data give us more ability to work with SQLite without writing queries instead we use Objects and Core Data will manage the data persistence for us.
<!-------------------------------------------------------------------------------------------------->

# Table of Content
 - Add Core Data.
    - [Add Core Data to a New Project](#add-core-data-to-a-new-xcode-project)
    - [Add Core Data to an Existing Project](#add-core-data-to-an-existing-project)
 - Interact with Core Data.
    - [Data Model inspector](#data-model-inspector)
    - [NSManagedObject files](#nsmanagedobject-files)
    - [AppDelegate](#appdelegate)
    - [CRUD in Core Data](#crud-in-core-data)
    - [Filter and Sorting](#filter-and-sorting)
    - [Relationship between Entities](#relationship-between-entities)
- [Reference](#reference)



<!-------------------------------------------------------------------------------------------------->
# Add Core Data
<!-------------------------------------------------------------------------------------------------->

## Add Core Data to a New Xcode Project
1. Select the Use Core Data checkbox, and click Next - [Example](https://docs-assets.developer.apple.com/published/bbc1147cb0/22fc548e-7697-4dae-a05a-71803b10082e.png)

2. The resulting project includes an .xcdatamodeld file - [Example](https://docs-assets.developer.apple.com/published/f36f47fbd1/3080773@2x.png)


<!-------------------------------------------------------------------------------------------------->
## Add Core Data to an Existing Project
1. Choose File > New > File and select the iOS platform tab. Scroll down to the Core Data section, select Data Model, and click Next - [Example](https://docs-assets.developer.apple.com/published/df67b17364/51ddb9a7-91de-4f4c-b1ec-7b92cf06e7a5.png)

2. Name your model file, select its group and targets, and click Create - [Example](https://docs-assets.developer.apple.com/published/4b60e08827/3122943@2x.png)

3. Xcode adds an .xcdatamodeld file with the specified name to your project - [Example](https://docs-assets.developer.apple.com/published/0e4ba5bda8/3080772@2x.png)


<!-------------------------------------------------------------------------------------------------->
# Interact with Core Data
<!-------------------------------------------------------------------------------------------------->

## Data Model inspector
> Entity is Table in Database world and Attribute is Column in Database world.

- **Entity inspector** <img src="https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreData/Art/Entity_Inspector_2x.png" height="350px" align="right">

    - **Name** Entity Name.
    
    - **Module**: If we want to use Core Data only on Target, for Example we build a Library or other projects and we want to use Core Data only in this library or project so we specify our Library or project in Module.
    
    - **Codegen**: To create [NSManagedObject files](#nsmanagedobject-files) manually or tell Xcode to generate them automatically for us.

        - **Manual/None**: We will create them.

            *Editor -> Create NSManagedObject Subclass -> Check on Data Model -> Check mark on Entity -> Create.*
        
        - **Class Definition**: Xcode will generate the files for us.
        
        - **Category/Extension**: Xcode will show `EntityName+CoreDataClass.swift` file only in the project and it will generate `EntityName+CoreDataProperties.swift` under the hood.

        > Make sure to clean up Build Folder before you build and delete the app if you change *Codegen*.

- **Attribute inspector**
    - **Custom Class**: if we want to make attribute is an Object of Class and the (Attribute type Transformable).


<!-------------------------------------------------------------------------------------------------->
## NSManagedObject files
> The Models must to confirm to **NSManageObject** which make Core Data to serialize and deserialize the object.

- `EntityName+CoreDataClass.swift`
    
Class declaration for Entity and it subclass of **NSManagedObject** (so it can save and retrieve from Core Data).

This file for all custom implementation or custom code (methods).

```swift
// Person+CoreDataClass.swift
@objc(Person)
public class Person: NSManageObject {
}
```

- `EntityName+CoreDataProperties.swift`
    
Extension of Entity class which contain all attributes as properties of the current entity.

Not recommend to make changes in this extension because every change will be overwritten, If you want to change properties change them on `.xcdatamodeld` file.

```swift
// Person+CoreDataProperties.swift
extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String
    @NSManaged public var age: Int64
}
```





<!-------------------------------------------------------------------------------------------------->
## AppDelegate
If we check on Core Data when we create project we will see in the `AppDelegate.swift` file that there are some code that automatically generated for our Core Data Model.

> If you add Core Data to an existing project. Make sure that NSPersistentContainer name matches **This_Name.xcdatamodeld**, and import CoreData.

```swift
lazy var persistentContainer: NSPersistentContainer = {        
    let container = NSPersistentContainer(name: "CoreDataName") 
    container.loadPersistentStores(completionHandler: { description, error in
        if let error = error as NSError? {
            fatalError("Unable to load persistent stores: \(error)")
        }
    })
    return container
}()


func saveContext() {
    let context = persistentContainer.viewContext
    if context.hasChanges {
        do {
            try context.save()
        } catch let error as NSError {
            print("Error: \(error), \(error.userInfo)")
        }
    }
}  
```

- `persistentContainer` property is to let us to interact with Core Data in our project.
- `saveContext()` method to let us save the changes in data.

We don't have access to the data in Core Data directly using **Persistent Container**, instead we use **Manged Object Context** to access the data in Core Data. 

To access **Managed Object Context** in ViewController
```swift
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
```


## CRUD in Core Data
We assume that we have a Person Entity in our project which hold some attributes like this:
```swift
// Person+CoreDataClass.swift
@objc(Person)
public class Person: NSManageObject {
    
}

// Person+CoreDataProperties.swift
extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        // This will return all data
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String
    @NSManaged public var age: Int64
}
```


So, first we need a reference of managed object context
```swift
// get context from persistentContainer in AppDelegate.swift
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
```

- **Read**
```swift
func readData() {
    // Read all Data from Core Data
    do {
        let people = try context.fetch(Person.fetchRequest())

    } catch {
        print("Error Reading Data: \(error)")
    }
}
```
> There are more methods for fetching data. fetchLimit, fetchOffset, etc... [See this link](https://developer.apple.com/documentation/coredata/nsfetchrequest)

- **Create**
```swift
func createData(name: String, age: Int64) {
    // Create new record
    let newPerson = Person(context: self.context)
    newPerson.name = name
    newPerson.age = age

    do {
        // Save the changes
        try context.save()

        // Re-fetch the data

    } catch {
        print("Error Creating Data: \(error)")
    }
}


createData(name: "John Cena", age: 46)
```

- **Update**
```swift
func updateData(referencePerson: Person, newName: String?, newAge: Int64?){
    if newName == nil && newAge == nil {
        print("No update happened for nil parameters!")
        return
    }

    // Update person name
    if let newName = newName {
        referencePerson.name = newName
    }

    // Update person age
    if let newAge = newAge {
        referencePerson.age = newAge
    }

    do {
        // Save the changes
        try context.save()

        // Re-fetch the data

    } catch {
        print("Error Updating Data: \(error)")
    }
}
```


- **Delete**
```swift
func deleteData(person: Person) {
    // Delete the data
    context.delete(person)

    do {
        // Save the changes
        try context.save()

        // Re-fetch the data

    } catch {
        print("Error Deleting Data: \(error)")
    }
}
```


## Filter and Sorting
In filtering we will use NSPredicate formats, and here is some resource of formats from [Apple](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Predicates/Articles/pSyntax.html) and other [Simple Explanation](https://nspredicate.xyz/).


```swift
let request = Person.fetchRequest() as NSFetchRequest<Person>

// Create Predicate for Filtering
let predicate = NSPredicate(format: "name CONTAINS %@", name)

// Set the filter predicate on the request
request.predicate = predicate

// Create SortDescriptor for Sorting
let sort = NSSortDescriptor(key: "age", ascending: true)

// Set the sort descriptor on the request
request.sortDescriptors = [sort]


do {
    // Fetch the result
    let result = try context.fetch(request)

} catch {
    print("Error filtering request: \(error)")
}
```

> There are more methods for fetching data. fetchLimit, fetchOffset, etc... [See this link](https://developer.apple.com/documentation/coredata/nsfetchrequest)


## Relationship between Entities
Relationships in Core Data let us link entities with each other - for example we have Department entity and Employee entity and each Department has there own employees so we link Department entity with Employee entity and make the relationship one-to-many (*Department has numbers of employees but Employee work in only one department*).

**Add Relationship to an Entity**

1. Go to Entity
2. Add new relationship
3. Set name for relationship (is recommended to set name as linked entity name)
4. Chose the Destination (which entity we want to link it with current entity)
5. Select inverse (the object attribute that hold reference of current entity) *If there are no inverse, do this steps in the other entity and it will appear*
6. Then do this step in the other entity.

Example

<img src="https://miro.medium.com/v2/resize:fit:640/1*lyRZO4ll1jxynOJA-XGONQ.gif">


Now if we build the project we will see that there are more methods added to `EntityName+CoreDataProperties.swift` file which help us to add or remove the data of this relationship.
```swift
// Department+CoreDataProperties.swift
extension Department {
    @obj(addEmployeeObject:)
    @NSManaged public func addToEmployee(_ value: Employee)

    @obj(removeEmployeeObject:)
    @NSManaged public func removeToEmployee(_ value: Employee)

    @obj(addEmployee:)
    @NSManaged public func addToEmployee(_ value: NSSet)

    @obj(removeEmployee:)
    @NSManaged public func removeToEmployee(_ value: NSSet)
}

```

# Reference
- [Apple Documentation](https://developer.apple.com/documentation/coredata)
- [Apple Documentation Archive](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreData/index.html#//apple_ref/doc/uid/TP40001075-CH2-SW1)
- [CodeWithChris Video Tutorial](https://youtu.be/O7u9nYWjvKk)