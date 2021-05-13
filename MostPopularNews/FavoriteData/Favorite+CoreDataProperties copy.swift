//
//  Favorite+CoreDataProperties.swift
//  
//
//  Created by Developer on 12.05.2021.
//
//

import Foundation
import CoreData


extension Favorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorite> {
        return NSFetchRequest<Favorite>(entityName: "Favorite")
    }

    @NSManaged public var newsHeadTitle: String?
    @NSManaged public var source: String?
    @NSManaged public var section: String?
    @NSManaged public var update: String?

}
