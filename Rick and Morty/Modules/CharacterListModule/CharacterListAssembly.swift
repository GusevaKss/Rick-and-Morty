//
//  CharacterListAssembly.swift
//  Rick and Morty
//
//  Created by Kseniya Kovgorenya on 7.12.24.
//

import Foundation

class CharacterListAssembly {
    private let networkService: CharactersNetworkProtocol
    
    init(networkService: CharactersNetworkProtocol) {
        self.networkService = networkService
    }
    
    func buildA() -> CharacterListViewController {
        let characterListViewController = CharacterListViewController(network: networkService, listType: CharacterListType.AdvTime)
        return characterListViewController
    }
    
    func buildR() -> CharacterListViewController {
        let characterListViewController = CharacterListViewController(network: networkService, listType: CharacterListType.RickMorty)
        return characterListViewController
    }
}
