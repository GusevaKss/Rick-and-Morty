//
//  CharacterListItem.swift
//  Rick and Morty
//
//  Created by Kseniya Kovgorenya on 25.11.24.
//

import Foundation

struct CharacterListItem: Codable {
    let id: Int?
    let name: String?
    let image: String?
}

struct CharacterListResponse: Codable {
    let results: [CharacterListItem]
}
