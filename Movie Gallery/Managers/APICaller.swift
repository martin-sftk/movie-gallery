//
//  APICaller.swift
//  Movie Gallery
//
//  Created by Martín Serrano on 13/09/23.
//

import Foundation

struct Constants {
    static let API_KEY = "f2935cd26cabae36c079fa4b3691e2bd"
    static let baseURL = "https://api.themoviedb.org"
    static let headers = [
      "accept": "application/json",
      "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMjkzNWNkMjZjYWJhZTM2YzA3OWZhNGIzNjkxZTJiZCIsInN1YiI6IjY1MDBhNzU4ZWZlYTdhMDExYWI4MjRhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cKMYEgWml52gxIpRhI7QMM3FusHOsOQv_yoiPokDlEA"
    ]
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Media], Error>) -> Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: "\(Constants.baseURL)/3/trending/movie/day?language=en-US")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Constants.headers
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, _, error in
            guard let data = data, error == nil else {
                 return
            }
            
            do {
                let results = try JSONDecoder().decode(MediaResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
            
        }
        task.resume()
    }
    
    func getTrendingTVShows(completion: @escaping (Result<[Media], Error>) -> Void) {
        let request = NSMutableURLRequest(url: NSURL(string: "\(Constants.baseURL)/3/trending/tv/day?language=en-US")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Constants.headers
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, _, error in
            guard let data = data, error == nil else {
                 return
            }
            
            do {
                let results = try JSONDecoder().decode(MediaResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
            
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Media], Error>) -> Void) {
        let request = NSMutableURLRequest(url: NSURL(string: "\(Constants.baseURL)/3/movie/upcoming?language=en-US&page=1")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Constants.headers
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, _, error in
            guard let data = data, error == nil else {
                 return
            }
            
            do {
                let results = try JSONDecoder().decode(MediaResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
            
        }
        task.resume()
    }
    
    func getPopularMovies(completion: @escaping (Result<[Media], Error>) -> Void) {
        let request = NSMutableURLRequest(url: NSURL(string: "\(Constants.baseURL)/3/movie/popular?language=en-US")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Constants.headers
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, _, error in
            guard let data = data, error == nil else {
                 return
            }
            
            do {
                let results = try JSONDecoder().decode(MediaResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
            
        }
        task.resume()
    }
    
    func getTopRatedMovies(completion: @escaping (Result<[Media], Error>) -> Void) {
        let request = NSMutableURLRequest(url: NSURL(string: "\(Constants.baseURL)/3/movie/top_rated?language=en-US&page=1")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Constants.headers
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, _, error in
            guard let data = data, error == nil else {
                 return
            }
            
            do {
                let results = try JSONDecoder().decode(MediaResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
            
        }
        task.resume()
    }
}
