//
//  NewsManager.swift
//  DemoProject
//
//  Created by Brainwork Technologies on 17/07/2020.
//  Copyright © 2020 Advatix Inc. All rights reserved.
//

import Foundation
struct  NewsManager {
    
   private let _Newsrespository =   NewsDataRepository()
    
    
    func createNews(news: NewsList) {
        _Newsrespository.create(news: news)
       }

       func fetchNews() -> [NewsList]? {
           return _Newsrespository.getAll()
       }
    
    func deleteNews(id: UUID) -> Bool {
        return _Newsrespository.delete(id: id)
    }
    
    
    func createDeletedNews(news: NewsList) {
     _Newsrespository.createDeleted(news: news)
    }

    func fetchDeletedNews() -> [NewsList]? {
        return _Newsrespository.getDeletedAll()
    }
   
    
    
    
}
