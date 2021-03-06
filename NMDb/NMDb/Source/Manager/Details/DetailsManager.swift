//
//  DetailsManager.swift
//  NMDb
//
//  Created by Gian Nucci on 01/02/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import UIKit

class DetailsManager: BaseManager {
    
    /// Movie Business
    private lazy var business: MovieBusiness = {
        return MovieBusiness()
    }()
    
    /// Movie Details Operation manager
    ///
    /// - Parameters:
    ///   - identifier: movie id
    ///   - completion: completion callback
    func fetchMovie(identifier: Int,
                    _ completion: @escaping MovieUICallback) {
        addOperation {
            self.business.movie(identifier: identifier, { (movie) in
                OperationQueue.main.addOperation {
                    completion(movie)
                }
            })
        }
    }
    
    /// Credits Operation Manager
    ///
    /// - Parameters:
    ///   - identifier: movie id
    ///   - completion: completion callback
    func fetchCredits(identifier: Int,
                      _ completion: @escaping CreditsUICallback) {
        addOperation {
            self.business.credits(identifier: identifier, { (movie) in
                OperationQueue.main.addOperation {
                    completion(movie)
                }
            })
        }
    }
}
