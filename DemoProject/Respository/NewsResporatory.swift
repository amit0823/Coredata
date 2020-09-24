//
//  NewsResporatory.swift
//  DemoProject
//
//  Created by Brainwork Technologies on 17/07/2020.
//  Copyright © 2020 Advatix Inc. All rights reserved.
//

import Foundation
import CoreData

protocol NewsRespository {
    func create(news: NewsList)
    func getAll() -> [NewsList]?
    func delete(id: UUID) -> Bool

}

struct NewsDataRepository: NewsRespository {
    func create(news: NewsList) {
        let newsobject = NewsData(context: PersistentStorage.shared.context)
        
        newsobject.descriptions = news.newsDescription
        newsobject.image = news.imageURL
        newsobject.title = news.newsTitle
        newsobject.date = news.updatedAt
        newsobject.iD = news.iD
        PersistentStorage.shared.saveContext()

    }
    
    func getAll() -> [NewsList]? {
        
        let getdata = PersistentStorage.shared.fetchManagedObject(managedObject: NewsData.self)
        
        var Newsobject : [NewsList] = []
        
        getdata?.forEach({(result) in
                
            Newsobject.append(result.convertToNews())
                
        })

        return Newsobject
        
        
    }
    
    
    func createDeleted(news: NewsList) {
           let newsobject = DeletedNews(context: PersistentStorage.shared.context)
           
           newsobject.descriptions = news.newsDescription
           newsobject.image = news.imageURL
           newsobject.title = news.newsTitle
           newsobject.date = news.updatedAt
           newsobject.iD = news.iD
           PersistentStorage.shared.saveContext()

       }
       
       func getDeletedAll() -> [NewsList]? {
           
           let getdata = PersistentStorage.shared.fetchManagedObject(managedObject: DeletedNews.self)
           
           var Newsobject : [NewsList] = []
           
           getdata?.forEach({(result) in
                   
               Newsobject.append(result.convertToNews())
                   
           })

           return Newsobject
           
           
       }
   
    
    
    
    
   func delete(id: UUID) -> Bool {

        let cdEmployee = getNews(byIdentifier: id)
        guard cdEmployee != nil else {return false}
        PersistentStorage.shared.context.delete(cdEmployee!)
        PersistentStorage.shared.saveContext()
        return true
    }


    private func getNews(byIdentifier id: UUID) -> NewsData?
    {
        let fetchRequest = NSFetchRequest<NewsData>(entityName: "NewsData")
        let predicate = NSPredicate(format: "iD==%@", id as CVarArg)

        fetchRequest.predicate = predicate
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first

            guard result != nil else {return nil}

            return result

        } catch let error {
            debugPrint(error)
        }

        return nil
    }
    
    
    
    
    
    
    
}
