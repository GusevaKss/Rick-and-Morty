//
//  CharacterDetailAssembly.swift
//  Rick and Morty
//
//  Created by Kseniya Kovgorenya on 8.12.24.
//

import Foundation

class CharacterDetailAssembly {
    func buildR(with characterID: Int) -> CharacterDetailViewController {
        let networkService: CharactersNetworkProtocol = CharactersNetworkService()
        let characterDetailViewController = CharacterDetailViewController(characterID: characterID, network: networkService)
        return characterDetailViewController
    }
    
    func buildA(with characterID: Int) -> CharacterDetailViewController {
        let networkService: CharactersNetworkProtocol = CharactersNetworkServiceAdventureTime()

        let characterDetailViewController = CharacterDetailViewController(characterID: characterID, network: networkService)
        return characterDetailViewController
    }
    
}
