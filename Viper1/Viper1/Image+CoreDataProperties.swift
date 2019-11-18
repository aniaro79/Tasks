//
//  Image+CoreDataProperties.swift
//  Viper1
//
//  Created by Meet on 15/11/19.
//  Copyright © 2019 IBM. All rights reserved.
//
//

import Foundation
import CoreData


extension Image {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Image> {
        return NSFetchRequest<Image>(entityName: "Image")
    }

    @NSManaged public var photo: Data?

}
