//
//  DataPersistenceManager.swift
//  Netflix Clone One
//
//  Created by Jaloliddin Egamberdiyev on 19/10/23.
//

import Foundation
import UIKit
import CoreData


class DataPersistenceManager {
    
    enum DataBaseError: Error {
        case faildToSaveData
        case failedToFetchData
        case failedToDeleteData
    }
    
    static let shared = DataPersistenceManager()
    
    func downloadTitleWith(model: Title, completion: @escaping (Result<Void, Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate  else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let item = TitleItem(context: context)
        
        item.original_title = model.original_title
        item.id = Int64(model.id)
        item.original_name = model.original_name
        item.overview = model.overview
        item.media_type = model.media_type
        item.poster_path = model.poster_path
        item.release_date = model.release_date
        item.vote_count = Int64(model.vote_count)
        item.vote_average = model.vote_average
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DataBaseError.faildToSaveData))
        }
    }
    func fetchingTitlesFromDataBase(completion: @escaping (Result<[TitleItem], Error>) -> Void) {
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate  else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let requaest: NSFetchRequest<TitleItem>
        
        requaest = TitleItem.fetchRequest()
        
        do {
            let titles = try context.fetch(requaest)
            completion(.success(titles))
        } catch {
            completion(.failure(DataBaseError.failedToFetchData))
        }
        
        
    }
    
    func deleteTitleWith(model: TitleItem, competion: @escaping (Result<Void, Error>)-> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate  else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(model) 
        
        
        do {
            try context.save()
            competion(.success(()))
        } catch {
            competion(.failure(DataBaseError.failedToDeleteData))
        }
    }
}
