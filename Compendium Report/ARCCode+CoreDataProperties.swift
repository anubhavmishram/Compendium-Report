//
//  ARCCode+CoreDataProperties.swift
//  Compendium Report
//
//  Created by Anubhav Mishra on 6/1/23.
//
//

import Foundation
import CoreData


extension ARCCode {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ARCCode> {
        return NSFetchRequest<ARCCode>(entityName: "ARCCode")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?

}

extension ARCCode : Identifiable {

}
