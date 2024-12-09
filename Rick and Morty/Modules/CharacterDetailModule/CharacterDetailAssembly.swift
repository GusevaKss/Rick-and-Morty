//
//  CharacterDetailAssembly.swift
//  Rick and Morty
//
//  Created by Kseniya Kovgorenya on 8.12.24.
//

import Foundation

class CharacterDetailAssembly {
    func build(with characterID: Int) -> CharacterDetailViewController {
        let networkService = CharactersNetworkService()
        let characterDetailViewController = CharacterDetailViewController(characterID: characterID, network: networkService)
        
        return characterDetailViewController
    }
}
