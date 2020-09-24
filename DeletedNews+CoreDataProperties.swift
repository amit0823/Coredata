//
//  DeletedNews+CoreDataProperties.swift
//  DemoProject
//
//  Created by Brainwork Technologies on 18/07/2020.
//  Copyright © 2020 Advatix Inc. All rights reserved.
//
//

import Foundation
import CoreData


extension DeletedNews {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DeletedNews> {
        return NSFetchRequest<DeletedNews>(entityName: "DeletedNews")
    }

    @NSManaged public var date: String?
    @NSManaged public var descriptions: String?
    @NSManaged public var iD: UUID?
    @NSManaged public var image: String?
    @NSManaged public var title: String?
    
    func convertToNews() -> NewsList
          {
           return NewsList(imageURL:image ?? nil , newsTitle:title!, updatedAt: date!, newsDescription: descriptions!, iD: self.iD!)
          }
}
