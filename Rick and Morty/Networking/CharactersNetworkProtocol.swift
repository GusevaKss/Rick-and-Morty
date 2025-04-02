//
//  CharactersNetworkProtocol.swift
//  Rick and Morty
//
//  Created by Kseniya Kovgorenya on 20.01.25.
//

import Foundation

protocol CharactersNetworkProtocol {
    func fetchCharacterList(completion: @escaping (Result<[CharacterListItem], Error>) -> Void)
    func fetchCharacterDetails(id: Int, completion: @escaping (Result<CharacterDetail, Error>) -> Void)
}
