//
//  MovieApiProvider.swift
//  NMDb
//
//  Created by Gian Nucci on 30/01/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import Foundation

class MovieApiProvider: MovieApiProtocol {
    
    private let upcomingEndpoint = "/movie/upcoming"
    private let popularEndpoint = "/movie/popular"
    private let movieEndpoint = "/movie/"
    
    /// Fetch Upcoming Movies
    ///
    /// - Parameters:
    ///   - parameters: api parameters
    ///   - completion: completion callback
    func upcomingMovies(withParameters parameters: NetworkParameters,
                        _ completion: @escaping MovieCallback) {
        
        _ = ApiProvider.sharedProvider.GET(upcomingEndpoint,
                                           parameters: parameters,
                                           header: nil,
                                           completion: { (result) in
            completion {
                return try result()
            }
        })
    }
    
    /// Fetch Popular Movies
    ///
    /// - Parameters:
    ///   - parameters: api parameters
    ///   - completion: completion callback
    func popularMovies(withParameters parameters: NetworkParameters,
                       _ completion: @escaping MovieCallback) {
        
        _ = ApiProvider.sharedProvider.GET(popularEndpoint,
                                           parameters: parameters,
                                           header: nil,
                                           completion: { (result) in
            completion {
                return try result()
            }
        })
    }
    
    /// Fetch Movie Details
    ///
    /// - Parameters:
    ///   - parameters: api parameters
    ///   - movieId: movie identifier
    ///   - completion: completion callback
    func fetchMovie(withParameters parameters: NetworkParameters,
                    movieId: String,
                    _ completion: @escaping MovieCallback) {
        
        _ = ApiProvider.sharedProvider.GET("\(movieEndpoint)\(movieId)",
                                           parameters: parameters,
                                           header: nil,
                                           completion: { (result) in
            completion {
                return try result()
            }
        })
    }
        
}
