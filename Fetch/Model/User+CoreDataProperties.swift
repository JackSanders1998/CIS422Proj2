//
//  User+CoreDataProperties.swift
//  Fetch
//
//  Created by Ronny on 2/25/21.
//
//

import Foundation
import CoreData


public class USER: NSManagedObject, Identifiable {
    @NSManaged public var breed: String
    @NSManaged public var name: String
    @NSManaged public var dogName: String
    @NSManaged public var created: Date?
    

}

extension USER {
    static func getAllUsers() -> NSFetchRequest<USER> {
        let request: NSFetchRequest<USER> = USER.fetchRequest() as! NSFetchRequest<USER>
        
//        let sortDescriptor = NSSortDescriptor(key: "created", ascending: true)
//
//        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
