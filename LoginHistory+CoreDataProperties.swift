//
//  LoginHistory+CoreDataProperties.swift
//  CKCC demo
//
//  Created by Student on 5/24/17.
//  Copyright © 2017 CKCC. All rights reserved.
//

import Foundation
import CoreData


extension LoginHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LoginHistory> {
        return NSFetchRequest<LoginHistory>(entityName: "LoginHistory");
    }

    @NSManaged public var username: String?
    @NSManaged public var time: NSDate?

}
