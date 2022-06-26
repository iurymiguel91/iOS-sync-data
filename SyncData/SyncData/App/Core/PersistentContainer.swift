//
//  PersistentContainer.swift
//  SyncData
//
//  Created by Iury da Rocha Miguel on 24/06/22.
//

import CoreData

protocol PersistentContainerProtocol {
    var containerViewContext: NSManagedObjectContext { get }
    func saveContext(backgroundContext: NSManagedObjectContext?)
}

class PersistentContainer: NSPersistentContainer, PersistentContainerProtocol {
    var containerViewContext: NSManagedObjectContext { viewContext }
    
    func saveContext(backgroundContext: NSManagedObjectContext? = nil) {
        let context = backgroundContext ?? viewContext
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch let error as NSError {
            print("Error: \(error), \(error.userInfo)")
        }
    }
}
