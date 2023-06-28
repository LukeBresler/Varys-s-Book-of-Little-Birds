//
//  DataManager.swift
//  Varys's Book of Little Birds
//
//  Created by Luke Bresler on 2023/06/27.
//

import Foundation
import SwiftUI

class CharacterDataManager: ObservableObject {
    @Published var characters: [Character] = []
    private var currentPage: Int = 1
    private var currentSearchQuery: String?
    
    
    // Fetches character data from the API.
    // - Parameter searchQuery: Optional search query to filter characters by name.
    func fetchCharacters(searchQuery: String? = nil) {
        guard let url = buildURL(searchQuery: searchQuery) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.cachePolicy = .reloadIgnoringCacheData
        
        URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let self = self, let data = data else {
                if let error = error {
                    print("Error fetching character data: \(error)")
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let characters = try decoder.decode([Character].self, from: data)
                
                DispatchQueue.main.async {
                    self.characters = characters
                }
            } catch {
                print("Error decoding character data: \(error)")
            }
        }.resume()
    }
    
    
    private func buildURL(searchQuery: String? = nil) -> URL? {
        var components = URLComponents(string: "https://anapioficeandfire.com/api/characters")!
        components.queryItems = [
            URLQueryItem(name: "page", value: "\(currentPage)"),
            URLQueryItem(name: "pageSize", value: "30")
        ]
        
        if let searchQuery = searchQuery {
            components.queryItems?.append(URLQueryItem(name: "name", value: searchQuery))
        }
        
        return components.url
    }
    
    private func extractLinkHeader(from url: URL) -> String? {
        if let response = URLSession.shared.configuration.httpAdditionalHeaders?["Link"] as? String {
            let links = response.components(separatedBy: ", ")
            for link in links {
                let components = link.components(separatedBy: "; ")
                if components.count == 2 {
                    let linkURLString = components[0].trimmingCharacters(in: CharacterSet(charactersIn: "<>"))
                    let linkRel = components[1].trimmingCharacters(in: .whitespaces).lowercased()
                    if linkRel == "rel=\"next\"" {
                        return linkURLString
                    }
                }
            }
        }
        return nil
    }
    
    func getNextPageURL(from linkHeader: String?) -> URL? {
        if let linkHeader = linkHeader, let url = URL(string: linkHeader) {
            return url
        }
        return nil
    }
    
    func loadMoreCharacters() {
        currentPage += 1
        fetchCharacters(searchQuery: currentSearchQuery)
    }
    
    func refreshCharacters() {
        currentPage = 1
        fetchCharacters(searchQuery: currentSearchQuery)
    }
    
    func performSearch(query: String) {
        currentSearchQuery = query
        refreshCharacters()
    }
}
