//
//  CharacterDetailAssembly.swift
//  Rick and Morty
//
//  Created by Kseniya Kovgorenya on 8.12.24.
//

import Foundation

class CharacterDetailAssembly {
    func build(with characterID: Int, forShow show: String) -> CharacterDetailViewController {
        let networkService: CharactersNetworkProtocol
        
        if show == "Adventure Time" {
            networkService = CharactersNetworkService(show: show)
        } else {
            networkService = CharactersNetworkService(show: show)
        }
        let characterDetailViewController = CharacterDetailViewController(characterID: characterID, showTitle: show, network: networkService as! CharactersNetworkService)
        print("Building CharacterDetail for \(show) with ID: \(characterID)")
        return characterDetailViewController
    }
}
