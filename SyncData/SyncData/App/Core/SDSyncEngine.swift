//
//  SDSyncEngine.swift
//  SyncData
//
//  Created by Iury da Rocha Miguel on 20/06/22.
//

import CoreData

protocol SDSyncEngineProtocol {
    var registeredClassesToSync: [String] { get }
    
    func registerNSManagedObjectClassToSync(classType: AnyClass)
}

class SDSyncEngine: SDSyncEngineProtocol {
    var registeredClassesToSync: [String] = []
    
    func registerNSManagedObjectClassToSync(classType: AnyClass) {
        let className = NSStringFromClass(classType)
        if classType.isSubclass(of: NSManagedObject.self) {
            if !registeredClassesToSync.contains(className) {
                registeredClassesToSync.append(className)
            } else {
                print("Unable to register \(className) as it is already registered")
            }
        } else {
            print("Unable to register \(className) as it is not a subclass of NSManagedObject")
        }
    }
    
    func mostRecentUpdatedAtDateForEntity(withName entityName: String) {
        let request = NSFetchRequest<NSManagedObject>(entityName: entityName)
        request.sortDescriptors = []
        request.fetchLimit = 1
        
    }
}
