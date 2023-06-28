//
//  Characters.swift
//  Varys's Book of Little Birds
//
//  Created by Luke Bresler on 2023/06/23.

import Foundation
import SwiftUI

struct Character: Identifiable, Codable, Equatable, Hashable {
    let id = UUID()
    
    let url: String
    let name: String
    let gender: String
    let culture: String
    let born: String
    let died: String?
    let titles: [String]
    let aliases: [String]
    let father: String?
    let mother: String?
    let spouse: String?
  //  let allegiances: [URL]
    let books: [String]
    let povBooks: [String]
    let tvSeries: [String]
    let playedBy: [String]
    var imageURL: String? // New property for the character's image URL if playedBy is not empty.
    var image: String?
}


