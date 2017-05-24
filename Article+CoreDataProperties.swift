//
//  Article+CoreDataProperties.swift
//  CKCC demo
//
//  Created by Student on 5/22/17.
//  Copyright © 2017 CKCC. All rights reserved.
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article");
    }

    @NSManaged public var title: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var imageUrl: String?
    @NSManaged public var content: String?

}
