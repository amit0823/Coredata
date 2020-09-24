//
//  NewsData+CoreDataProperties.swift
//  DemoProject
//
//  Created by Brainwork Technologies on 17/07/2020.
//  Copyright © 2020 Advatix Inc. All rights reserved.
//
//

import Foundation
import CoreData


extension NewsData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsData> {
        return NSFetchRequest<NewsData>(entityName: "NewsData")
    }

    @NSManaged public var date: String?
    @NSManaged public var descriptions: String?
    @NSManaged public var image: String?
    @NSManaged public var title: String?
    @NSManaged public var iD: UUID?

    func convertToNews() -> NewsList
       {
        return NewsList(imageURL:image ?? nil , newsTitle:title!, updatedAt: date!, newsDescription: descriptions!, iD: self.iD!)
       }
    
}
