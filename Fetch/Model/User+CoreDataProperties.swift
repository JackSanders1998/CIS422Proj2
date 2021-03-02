//
//  User+CoreDataProperties.swift
//  Fetch
//
//  Created by Ronny on 2/25/21.
//
//

import Foundation
import CoreData


public class User: NSManagedObject, Identifiable {
    @NSManaged public var breed: String
    @NSManaged public var name: String
    @NSManaged public var dogName: String
    @NSManaged public var created: Date?
    

}

extension User {
    static func getAllUsers() -> NSFetchRequest<User> {
        let request: NSFetchRequest<User> = User.fetchRequest() as! NSFetchRequest<User>
        
//        let sortDescriptor = NSSortDescriptor(key: "created", ascending: true)
//
//        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
