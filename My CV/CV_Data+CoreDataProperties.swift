//
//  CV_Data+CoreDataProperties.swift
//  My CV
//
//  Created by Maxim  Grozniy on 29.04.16.
//  Copyright © 2016 Maxim  Grozniy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData
import UIKit

extension CV_Data {

    @NSManaged var id: NSNumber?
    @NSManaged var photo: NSData?
    @NSManaged var name: String?
    @NSManaged var dateOfBirth: NSDate?
    @NSManaged var personality: String?
    @NSManaged var education: String?
    @NSManaged var work_experience: String?
    @NSManaged var achievements: String?
    @NSManaged var skills: String?
    @NSManaged var expectations: String?
    @NSManaged var projects: String?
    
    class func newItem(context: NSManagedObjectContext, id: NSNumber, photo: NSData, name: String, dateOfBirth: NSDate, personality: String = "", education: String = "", work_experience: String = "", achievements: String = "", skills: String = "", expectations: String = "", projects: String = "") {
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("CV_Data", inManagedObjectContext: context) as! CV_Data
        newItem.id = id
        newItem.photo = photo
        newItem.name = name
        newItem.dateOfBirth = dateOfBirth
        newItem.personality = personality
        newItem.education = education
        newItem.work_experience = work_experience
        newItem.achievements = achievements
        newItem.skills = skills
        newItem.expectations = expectations
        newItem.projects = projects
        
        do {
            try context.save()
        } catch {
            print(NSError.description())
        }
    }
    
    class func getItem(id: NSNumber) -> [CV_Data]{
        let context = getManagerContext()
        
        let fetchRequest = NSFetchRequest(entityName: "CV_Data")
        let predicate = NSPredicate(format: "id = %@", id)
        fetchRequest.predicate = predicate
        
        var cv = [CV_Data]()
        
        do {
            cv = try context.executeFetchRequest(fetchRequest) as! [CV_Data]
        } catch {
            print(NSError.description())
        }
        
        return cv
    }
    
    class func getAllItems() -> [CV_Data] {
        let context = getManagerContext()
        
        let fetchRequest = NSFetchRequest(entityName: "CV_Data")
        let sortCV = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [sortCV]
        
        var cv = [CV_Data]()
        
        do {
            cv = try context.executeFetchRequest(fetchRequest) as! [CV_Data]
        } catch {
            print(NSError.description())
        }
        
        return cv
    }
    
    class func deleteItem(id: NSNumber) -> Bool {
        var isDeleted = true
        
        let context = getManagerContext()
        
        let fetchRequest = NSFetchRequest(entityName: "CV_Data")
        let predicate = NSPredicate(format: "id = %@", id)
        fetchRequest.predicate = predicate
        
        var cv = [CV_Data]()
        
        do {
            cv = try context.executeFetchRequest(fetchRequest) as! [CV_Data]
            if cv.count == 0 {
                isDeleted = false
            } else {
                for item in cv {
                    context.deleteObject(item)
                }
                
                do {
                    try context.save()
                } catch {}
            }
        } catch {
            print(NSError.description())
        }
        
        return isDeleted
    }
    
    class func deleteData() {
        let context = getManagerContext()
        
        let fetchRequest = NSFetchRequest(entityName: "CV_Data")
        
        var cv = [CV_Data]()
        
        do {
            cv = try context.executeFetchRequest(fetchRequest) as! [CV_Data]
            for item in cv {
                context.deleteObject(item)
            }
            
            do {
                try context.save()
                } catch {}
            
        } catch {
            print(NSError.description())
        }

    }
    
    

}


