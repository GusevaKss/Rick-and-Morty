//
//  CharacterDetailAssembly.swift
//  Rick and Morty
//
//  Created by Kseniya Kovgorenya on 8.12.24.
//

import Foundation

import Foundation

class CharacterDetailAssembly {
    func build(with characterID: Int, forShow show: String) -> CharacterDetailViewController {
        let networkService: CharactersNetworkProtocol
        if show == "Adventure Time" {
            networkService = CharactersNetworkServiceAdventureTime(show: show)
        } else {
            networkService = CharactersNetworkService(show: show)
        }
        let characterDetailViewController = CharacterDetailViewController(characterID: characterID, network: networkService as! CharactersNetworkService)
        
        return characterDetailViewController
    }
}
