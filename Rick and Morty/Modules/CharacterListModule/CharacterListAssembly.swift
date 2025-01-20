//
//  CharacterListAssembly.swift
//  Rick and Morty
//
//  Created by Kseniya Kovgorenya on 7.12.24.
//

import Foundation

class CharacterListAssembly {
    private let networkService: CharactersNetworkProtocol
    private let showTitle: String
    
    init(networkService: CharactersNetworkProtocol, showTitle: String) {
        self.networkService = networkService
        self.showTitle = showTitle
    }
    
    func build() -> CharacterListViewController {
        let characterListViewController = CharacterListViewController(network: networkService, showTitle: showTitle)
        return characterListViewController
    }
}
