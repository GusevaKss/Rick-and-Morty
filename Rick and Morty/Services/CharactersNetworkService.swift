//
//  CharactersNetworkService.swift
//  Rick and Morty
//
//  Created by Kseniya Kovgorenya on 25.11.24.
//

import Foundation
import Alamofire

protocol CharactersNetworkProtocol {
    func fetchCharacterList(completion: @escaping (Result<[CharacterListItem], Error>) -> Void)
    func fetchCharacterDetails(id: Int, completion: @escaping (Result<CharacterDetail, Error>) -> Void)
}

class CharactersNetworkService: CharactersNetworkProtocol {
    func fetchCharacterList(completion: @escaping (Result<[CharacterListItem], Error>) -> Void) {
        let url = "https://rickandmortyapi.com/api/character"
        AF.request(url)
            .validate()
            .responseDecodable(of: CharacterListResponse.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data.results))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

    func fetchCharacterDetails(id: Int, completion: @escaping (Result<CharacterDetail, Error>) -> Void) {
        let url = "https://rickandmortyapi.com/api/character/\(id)"
        AF.request(url)
            .validate()
            .responseDecodable(of: CharacterDetail.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
