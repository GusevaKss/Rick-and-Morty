//
//  CharacterListAssembly.swift
//  Rick and Morty
//
//  Created by Kseniya Kovgorenya on 7.12.24.
//

import Foundation

class CharacterListAssembly {
    func build() -> CharacterListViewController {
        let networkService = CharactersNetworkService()
        let characterListViewController = CharacterListViewController(network: networkService)
        
        return characterListViewController
    }
}
